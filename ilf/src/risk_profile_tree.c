#include "risk_profile_tree.h"
#include <libxml/xpath.h>
#include <string.h>

RiskProfileData *
risk_profile_data_new(const gchar *profile_id, const gchar *risiko_name,
                      const gchar *faktor_penilaian, guint32 risk_id, gdouble w, 
                      guint id, gchar *threshold, gchar *scoreFormula, gchar *scoreRule, 
                      gchar *ratingRule, gchar *valueRule, xmlNodePtr xml_node)
{
    RiskProfileData *data = g_new0(RiskProfileData, 1);
    data->profile_id = g_strdup(profile_id);
    data->risiko_name = g_strdup(risiko_name);
    data->faktor_penilaian = g_strdup(faktor_penilaian);
    data->risk_id = risk_id;
    data->xml_node = xml_node;
    data->weight = w;
    data->id = id;
    data->threshold = g_strdup(threshold);
    data->scoreFormula = g_strdup(scoreFormula);
    data->scoreRule = g_strdup(scoreRule);
    data->ratingRule = g_strdup(ratingRule);
    data->valueRule = g_strdup(valueRule);
    
    return data;
}

void
risk_profile_data_free(RiskProfileData *data)
{
    if (!data)
        return;

    g_free(data->profile_id);
    g_free(data->risiko_name);
    g_free(data->faktor_penilaian);
    g_free(data);
}

gboolean
is_parent_child_relation(const gchar *parent_id, const gchar *child_id)
{
    if (!parent_id || !child_id)
        return FALSE;

    gsize parent_len = strlen(parent_id);
    gsize child_len = strlen(child_id);

    // Both should be same length and divisible by 2 (composed of 2-digit segments)
    if (parent_len != child_len || parent_len < 4 || parent_len % 2 != 0)
        return FALSE;

    // Child must be different from parent
    if (g_strcmp0(parent_id, child_id) == 0)
        return FALSE;

    // Hierarchy logic:
    // A parent is a node where all trailing segments (after the first difference) are "00"
    // A child must have:
    //   1. All segments matching the parent up to a certain point
    //   2. The first differing segment in the parent must be "00"
    //   3. The child's segments after this point can be non-zero
    //   4. The parent should be the DIRECT parent (only one level up)
    //
    // Examples:
    //   RI0100000000 is parent of RI0100100000, RI0100200000, etc.
    //   RI0100100000 is parent of RI0100100100, RI0100100200, etc.
    //   RI0100100100 is parent of RI0100100101, RI0100100102, etc.

    gint num_segments = parent_len / 2;
    gint first_diff_segment = -1;

    // Find the first segment that differs
    for (gint i = 0; i < num_segments; i++) {
        gint pos = i * 2;
        if (parent_id[pos] != child_id[pos] || parent_id[pos + 1] != child_id[pos + 1]) {
            first_diff_segment = i;
            break;
        }
    }

    // If all segments match, they are the same (already checked above, but be safe)
    if (first_diff_segment == -1)
        return FALSE;

    // Check that the parent has "00" at the first difference point
    gint pos = first_diff_segment * 2;
    if (parent_id[pos] != '0' || parent_id[pos + 1] != '0')
        return FALSE;

    // Check that the child has non-"00" at the first difference point
    if (child_id[pos] == '0' && child_id[pos + 1] == '0')
        return FALSE;

    // Check that all segments after first_diff_segment+1 in parent are "00"
    // (parent must have all trailing zeros after the first difference)
    for (gint i = first_diff_segment + 1; i < num_segments; i++) {
        gint check_pos = i * 2;
        if (parent_id[check_pos] != '0' || parent_id[check_pos + 1] != '0')
            return FALSE;
    }

    // Check that child has all trailing zeros starting from first_diff_segment+2
    // (child must have only one level of difference to be a direct child)
    for (gint i = first_diff_segment + 2; i < num_segments; i++) {
        gint check_pos = i * 2;
        if (child_id[check_pos] != '0' || child_id[check_pos + 1] != '0')
            return FALSE;
    }

    return TRUE;
}

/**
 * Helper function to extract text content from an XML element
 */
static gchar *
get_element_text(xmlNodePtr parent, const gchar *element_name)
{
    xmlNodePtr cur = parent->children;
    while (cur != NULL) {
        if (cur->type == XML_ELEMENT_NODE
            && !xmlStrcmp(cur->name, (const xmlChar *) element_name)) {
            xmlChar *content = xmlNodeGetContent(cur);
            if (content) {
                gchar *result = g_strdup((const gchar *) content);
                xmlFree(content);
                return result;
            }
        }
        cur = cur->next;
    }
    return NULL;
}

/**
 * GTraverseFunc to free node data
 */
static gboolean
free_node_data(GNode *node, gpointer data)
{
    (void) data; // Unused
    if (node->data) {
        risk_profile_data_free((RiskProfileData *) node->data);
        node->data = NULL;
    }
    return FALSE; // Continue traversal
}

void
free_risk_profile_tree_data(GNode *root)
{
    if (!root)
        return;
    g_node_traverse(root, G_POST_ORDER, G_TRAVERSE_ALL, -1, free_node_data, NULL);
}

GNode *
build_risk_profile_tree(xmlDocPtr doc)
{
    if (!doc)
        return NULL;

    // Use XPath to get all RiskProfile nodes
    xmlXPathContextPtr xpath_ctx = xmlXPathNewContext(doc);
    if (!xpath_ctx) {
        g_warning("Failed to create XPath context");
        return NULL;
    }

    xmlXPathObjectPtr xpath_obj
        = xmlXPathEvalExpression((const xmlChar *) "//RiskProfile", xpath_ctx);
    if (!xpath_obj) {
        xmlXPathFreeContext(xpath_ctx);
        g_warning("Failed to evaluate XPath expression");
        return NULL;
    }

    xmlNodeSetPtr nodeset = xpath_obj->nodesetval;
    if (!nodeset || nodeset->nodeNr == 0) {
        xmlXPathFreeObject(xpath_obj);
        xmlXPathFreeContext(xpath_ctx);
        g_warning("No RiskProfile nodes found");
        return NULL;
    }

    // Create hash table to store all nodes by Profile_ID for quick lookup
    GHashTable *nodes_by_id = g_hash_table_new_full(g_str_hash, g_str_equal, g_free, NULL);

    // First pass: Create all nodes
    for (int i = 0; i < nodeset->nodeNr; i++) {
        xmlNodePtr cur = nodeset->nodeTab[i];

        gchar *profile_id = get_element_text(cur, "Profile_ID");
        gchar *risiko_name = get_element_text(cur, "risiko_name");
        gchar *faktor_penilaian = get_element_text(cur, "Faktor_Penilaian");
        gchar *risk_id_str = get_element_text(cur, "Risk_ID");
        gchar *weight_str = get_element_text(cur, "Bobot");
        gchar *idstr = get_element_text(cur, "ID");
        gchar *threshold = get_element_text(cur, "Threshold");
        gchar *scoreFormula = get_element_text(cur, "ScoreFormula");
        gchar *scoreRule = get_element_text(cur, "score_rule");
        gchar *ratingRule = get_element_text(cur, "rating_rule");
        gchar *valueRule = get_element_text(cur, "value_rule");
        gchar *thresholdcdata = get_element_text(cur, "threshold_cdata");
        
        guint32 risk_id = 0;
        if (risk_id_str) {
            risk_id = (guint32) strtoul(risk_id_str, NULL, 10);
            g_free(risk_id_str);
        }

        gdouble weight = 0.0;
        //  weight = g_strtod(weight_str, NULL);
        //     g_free(weight_str);
        if (weight_str) {
            weight = g_strtod(weight_str, NULL);
            g_free(weight_str);
        }

        guint id = 0;

        if (idstr) {
            id = (guint) strtoul(idstr, NULL, 10);
            g_free(idstr);
        }
        //  id = (guint) strtoul(idstr, NULL, 10);
        //     g_free(id);

        if (!profile_id) {
            g_warning("RiskProfile node missing Profile_ID");
            g_free(risiko_name);
            g_free(faktor_penilaian);
            continue;
        }

        RiskProfileData *data
            = risk_profile_data_new(profile_id, risiko_name, faktor_penilaian,risk_id, 
                weight, id, thresholdcdata, scoreFormula, scoreRule, ratingRule, valueRule, cur);
        GNode *node = g_node_new(data);

        g_hash_table_insert(nodes_by_id, g_strdup(profile_id), node);

        g_free(profile_id);
        g_free(risiko_name);
        g_free(faktor_penilaian);
    }

    // Second pass: Build parent-child relationships
    GHashTableIter iter;
    gpointer key, value;

    // Try to find parent for ALL nodes first
    // Only nodes without parents become root nodes
    GHashTable *has_parent = g_hash_table_new(g_str_hash, g_str_equal);

    g_hash_table_iter_init(&iter, nodes_by_id);
    while (g_hash_table_iter_next(&iter, &key, &value)) {
        GNode *node = (GNode *) value;
        RiskProfileData *data = (RiskProfileData *) node->data;
        const gchar *profile_id = data->profile_id;

        // Try to find a parent for this node
        gboolean found_parent = FALSE;
        GHashTableIter parent_iter;
        gpointer parent_key, parent_value;

        g_hash_table_iter_init(&parent_iter, nodes_by_id);
        while (g_hash_table_iter_next(&parent_iter, &parent_key, &parent_value)) {
            const gchar *potential_parent_id = (const gchar *) parent_key;
            if (is_parent_child_relation(potential_parent_id, profile_id)) {
                GNode *parent_node = (GNode *) parent_value;
                g_node_append(parent_node, node);
                g_hash_table_insert(has_parent, (gpointer) profile_id, GINT_TO_POINTER(1));
                found_parent = TRUE;
                break;
            }
        }
    }

    // Collect root nodes (nodes that don't have a parent)
    GPtrArray *root_nodes = g_ptr_array_new();
    g_hash_table_iter_init(&iter, nodes_by_id);
    while (g_hash_table_iter_next(&iter, &key, &value)) {
        const gchar *profile_id = (const gchar *) key;
        if (!g_hash_table_contains(has_parent, profile_id)) {
            GNode *node = (GNode *) value;
            g_ptr_array_add(root_nodes, node);
        }
    }

    g_hash_table_destroy(has_parent);

    // Create a virtual root node to hold all root nodes
    GNode *virtual_root = g_node_new(NULL);
    for (guint i = 0; i < root_nodes->len; i++) {
        GNode *root_node = g_ptr_array_index(root_nodes, i);
        g_node_append(virtual_root, root_node);
    }

    g_ptr_array_free(root_nodes, TRUE);
    g_hash_table_destroy(nodes_by_id);
    xmlXPathFreeObject(xpath_obj);
    xmlXPathFreeContext(xpath_ctx);

    return virtual_root;
}

/**
 * GNodeTraverseFunc to find node by Profile_ID
 */
typedef struct {
    const gchar *target_id;
    GNode *result;
} FindNodeData;

static gboolean
find_node_traverse(GNode *node, gpointer user_data)
{
    FindNodeData *find_data = (FindNodeData *) user_data;
    if (!node->data)
        return FALSE;

    RiskProfileData *data = (RiskProfileData *) node->data;
    if (g_strcmp0(data->profile_id, find_data->target_id) == 0) {
        find_data->result = node;
        return TRUE; // Stop traversal
    }

    return FALSE; // Continue traversal
}

GNode *
find_node_by_profile_id(GNode *root, const gchar *profile_id)
{
    if (!root || !profile_id)
        return NULL;

    FindNodeData find_data = { .target_id = profile_id, .result = NULL };

    g_node_traverse(root, G_PRE_ORDER, G_TRAVERSE_ALL, -1, find_node_traverse, &find_data);

    return find_data.result;
}

void
print_risk_profile_tree(GNode *node, gint depth)
{
    if (!node)
        return;

    // Print indentation
    for (gint i = 0; i < depth; i++) {
        g_print("  ");
    }

    // Print node data
    if (node->data) {
        RiskProfileData *data = (RiskProfileData *) node->data;
        g_print("[%s] %s - %s\n", data->profile_id,
                data->risiko_name ? data->risiko_name : "(no name)",
                data->faktor_penilaian ? data->faktor_penilaian : "(no factor)");
    } else {
        g_print("(virtual root)\n");
    }

    // Print children
    GNode *child = node->children;
    while (child) {
        print_risk_profile_tree(child, depth + 1);
        child = child->next;
    }
}
