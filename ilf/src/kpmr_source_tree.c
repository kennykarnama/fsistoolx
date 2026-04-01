#include "kpmr_source_tree.h"
#include <libxml/xpath.h>
#include <string.h>

KpmrSourceData *
kpmr_source_data_new(const gchar *code, const gchar *risk_id,
                     const gchar *assesment_factor, const gchar *pic, 
                     guint32 numeric_id, guint32 value, gchar *remark, xmlNodePtr xml_node)
{
    KpmrSourceData *data = g_new0(KpmrSourceData, 1);
    data->code = g_strdup(code);
    data->risk_id = g_strdup(risk_id);
    data->assesment_factor = g_strdup(assesment_factor);
    data->pic = g_strdup(pic);
    data->numeric_id = numeric_id;
    data->xml_node = xml_node;
    data->value = value;
    data->remark = remark ? g_strdup(remark) : NULL;
    return data;
}

void
kpmr_source_data_free(KpmrSourceData *data)
{
    if (!data)
        return;

    g_free(data->code);
    g_free(data->risk_id);
    g_free(data->assesment_factor);
    g_free(data->pic);
    g_free(data);
}

gboolean
kpmr_is_parent_child_relation(const gchar *parent_code, const gchar *child_code)
{
    if (!parent_code || !child_code)
        return FALSE;

    gsize parent_len = strlen(parent_code);
    gsize child_len = strlen(child_code);

    // Both should be same length and divisible by 2 (composed of 2-digit segments)
    if (parent_len != child_len || parent_len < 4 || parent_len % 2 != 0)
        return FALSE;

    // Child must be different from parent
    if (g_strcmp0(parent_code, child_code) == 0)
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
    //   SK01001000 is parent of SK01001001, SK01001002, SK01001003, SK01001004
    //   SK01002000 is parent of SK01002001, SK01002002, SK01002003
    //   SK01003000 is parent of SK01003001, SK01003002, SK01003003, SK01003004, SK01003005
    //   SK01004000 is parent of SK01004001, SK01004002, SK01004003, SK01004004

    gint num_segments = parent_len / 2;
    gint first_diff_segment = -1;

    // Find the first segment that differs
    for (gint i = 0; i < num_segments; i++) {
        gint pos = i * 2;
        if (parent_code[pos] != child_code[pos] || parent_code[pos + 1] != child_code[pos + 1]) {
            first_diff_segment = i;
            break;
        }
    }

    // If all segments match, they are the same (already checked above, but be safe)
    if (first_diff_segment == -1)
        return FALSE;

    // Check that the parent has "00" at the first difference point
    gint pos = first_diff_segment * 2;
    if (parent_code[pos] != '0' || parent_code[pos + 1] != '0')
        return FALSE;

    // Check that the child has non-"00" at the first difference point
    if (child_code[pos] == '0' && child_code[pos + 1] == '0')
        return FALSE;

    // Check that all segments after first_diff_segment+1 in parent are "00"
    // (parent must have all trailing zeros after the first difference)
    for (gint i = first_diff_segment + 1; i < num_segments; i++) {
        gint check_pos = i * 2;
        if (parent_code[check_pos] != '0' || parent_code[check_pos + 1] != '0')
            return FALSE;
    }

    // Check that child has all trailing zeros starting from first_diff_segment+2
    // (child must have only one level of difference to be a direct child)
    for (gint i = first_diff_segment + 2; i < num_segments; i++) {
        gint check_pos = i * 2;
        if (child_code[check_pos] != '0' || child_code[check_pos + 1] != '0')
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
        kpmr_source_data_free((KpmrSourceData *) node->data);
        node->data = NULL;
    }
    return FALSE; // Continue traversal
}

void
free_kpmr_source_tree_data(GNode *root)
{
    if (!root)
        return;
    g_node_traverse(root, G_POST_ORDER, G_TRAVERSE_ALL, -1, free_node_data, NULL);
}

GNode *
build_kpmr_source_tree(xmlDocPtr doc)
{
    if (!doc)
        return NULL;

    // Use XPath to get all DATA_RECORD nodes
    xmlXPathContextPtr xpath_ctx = xmlXPathNewContext(doc);
    if (!xpath_ctx) {
        g_warning("Failed to create XPath context");
        return NULL;
    }

    xmlXPathObjectPtr xpath_obj
        = xmlXPathEvalExpression((const xmlChar *) "//DATA_RECORD", xpath_ctx);
    if (!xpath_obj) {
        xmlXPathFreeContext(xpath_ctx);
        g_warning("Failed to evaluate XPath expression");
        return NULL;
    }

    xmlNodeSetPtr nodeset = xpath_obj->nodesetval;
    if (!nodeset || nodeset->nodeNr == 0) {
        xmlXPathFreeObject(xpath_obj);
        xmlXPathFreeContext(xpath_ctx);
        g_warning("No DATA_RECORD nodes found");
        return NULL;
    }

    // Create hash table to store all nodes by code for quick lookup
    // We need to handle multiple records with the same code (different validity periods)
    // For tree building, we'll use the first occurrence of each unique code
    GHashTable *nodes_by_code = g_hash_table_new_full(g_str_hash, g_str_equal, g_free, NULL);

    // First pass: Create all nodes (only first occurrence of each code)
    for (int i = 0; i < nodeset->nodeNr; i++) {
        xmlNodePtr cur = nodeset->nodeTab[i];

        gchar *code = get_element_text(cur, "code");
        gchar *risk_id = get_element_text(cur, "risk_id");
        gchar *assesment_factor = get_element_text(cur, "assesment_factor");
        gchar *pic = get_element_text(cur, "pic");
        gchar *numeric_id_str = get_element_text(cur, "numeric_id");

        gchar *value_str = get_element_text(cur, "value");
        guint32 value = 0;
        if (value_str) {
            value = (guint32) strtoul(value_str, NULL, 10);
            g_free(value_str);
        }

        gchar *remark = get_element_text(cur, "remark");

        guint32 numeric_id = 0;
        if (numeric_id_str) {
            numeric_id = (guint32) strtoul(numeric_id_str, NULL, 10);
            g_free(numeric_id_str);
        }

        if (!code) {
            g_warning("DATA_RECORD node missing code");
            g_free(risk_id);
            g_free(assesment_factor);
            g_free(pic);
            g_free(remark);
            continue;
        }

        // Only add if we haven't seen this code before
        if (!g_hash_table_contains(nodes_by_code, code)) {
            KpmrSourceData *data
                = kpmr_source_data_new(code, risk_id, assesment_factor, pic, numeric_id, value, remark, cur);
            GNode *node = g_node_new(data);

            g_hash_table_insert(nodes_by_code, g_strdup(code), node);
        }

        g_free(code);
        g_free(risk_id);
        g_free(assesment_factor);
        g_free(pic);
    }

    // Second pass: Build parent-child relationships
    GHashTableIter iter;
    gpointer key, value;

    // Try to find parent for ALL nodes first
    // Only nodes without parents become root nodes
    GHashTable *has_parent = g_hash_table_new(g_str_hash, g_str_equal);

    g_hash_table_iter_init(&iter, nodes_by_code);
    while (g_hash_table_iter_next(&iter, &key, &value)) {
        GNode *node = (GNode *) value;
        KpmrSourceData *data = (KpmrSourceData *) node->data;
        const gchar *code = data->code;

        // Try to find a parent for this node
        gboolean found_parent = FALSE;
        GHashTableIter parent_iter;
        gpointer parent_key, parent_value;

        g_hash_table_iter_init(&parent_iter, nodes_by_code);
        while (g_hash_table_iter_next(&parent_iter, &parent_key, &parent_value)) {
            const gchar *potential_parent_code = (const gchar *) parent_key;
            if (kpmr_is_parent_child_relation(potential_parent_code, code)) {
                GNode *parent_node = (GNode *) parent_value;
                g_node_append(parent_node, node);
                g_hash_table_insert(has_parent, (gpointer) code, GINT_TO_POINTER(1));
                found_parent = TRUE;
                break;
            }
        }
    }

    // Collect root nodes (nodes that don't have a parent)
    GPtrArray *root_nodes = g_ptr_array_new();
    g_hash_table_iter_init(&iter, nodes_by_code);
    while (g_hash_table_iter_next(&iter, &key, &value)) {
        const gchar *code = (const gchar *) key;
        if (!g_hash_table_contains(has_parent, code)) {
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
    g_hash_table_destroy(nodes_by_code);
    xmlXPathFreeObject(xpath_obj);
    xmlXPathFreeContext(xpath_ctx);

    return virtual_root;
}

/**
 * GNodeTraverseFunc to find node by code
 */
typedef struct {
    const gchar *target_code;
    GNode *result;
} FindNodeData;

static gboolean
find_node_traverse(GNode *node, gpointer user_data)
{
    FindNodeData *find_data = (FindNodeData *) user_data;
    if (!node->data)
        return FALSE;

    KpmrSourceData *data = (KpmrSourceData *) node->data;
    if (g_strcmp0(data->code, find_data->target_code) == 0) {
        find_data->result = node;
        return TRUE; // Stop traversal
    }

    return FALSE; // Continue traversal
}

GNode *
find_kpmr_node_by_code(GNode *root, const gchar *code)
{
    if (!root || !code)
        return NULL;

    FindNodeData find_data = { .target_code = code, .result = NULL };

    g_node_traverse(root, G_PRE_ORDER, G_TRAVERSE_ALL, -1, find_node_traverse, &find_data);

    return find_data.result;
}

void
print_kpmr_source_tree(GNode *node, gint depth)
{
    if (!node)
        return;

    // Print indentation
    for (gint i = 0; i < depth; i++) {
        g_print("  ");
    }

    // Print node data
    if (node->data) {
        KpmrSourceData *data = (KpmrSourceData *) node->data;
        g_print("[%s] Risk ID: %s - %s\n", data->code,
                data->risk_id ? data->risk_id : "(no risk_id)",
                data->assesment_factor ? data->assesment_factor : "(no factor)");
    } else {
        g_print("(virtual root)\n");
    }

    // Print children
    GNode *child = node->children;
    while (child) {
        print_kpmr_source_tree(child, depth + 1);
        child = child->next;
    }
}
