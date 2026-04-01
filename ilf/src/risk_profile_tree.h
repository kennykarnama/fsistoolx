#ifndef RISK_PROFILE_TREE_H
#define RISK_PROFILE_TREE_H

#include <glib.h>
#include <libxml/parser.h>
#include <libxml/tree.h>

/**
 * Structure to hold RiskProfile node data in the tree
 */
typedef struct {
    gchar *profile_id;
    gchar *risiko_name;
    gchar *faktor_penilaian;
    gdouble weight;
    guint id;
    guint32 risk_id;
    gchar *threshold;
    gchar *scoreFormula;
    gchar *scoreRule;
    gchar *ratingRule;
    gchar *valueRule;
    xmlNodePtr xml_node; // Reference to the original XML node
} RiskProfileData;

/**
 * Create a new RiskProfileData structure
 *
 * @param profile_id The Profile_ID value
 * @param risiko_name The risiko_name value
 * @param faktor_penilaian The Faktor_Penilaian value
 * @param xml_node The XML node reference
 * @return A newly allocated RiskProfileData structure
 */
RiskProfileData *risk_profile_data_new(const gchar *profile_id, const gchar *risiko_name,
                                       const gchar *faktor_penilaian, 
                                       guint32 risk_id,
                                       gdouble weight, guint id,
                                       gchar *threshold,
                                       gchar *scoreFormula,
                                       gchar *scoreRule, gchar *ratingRule,
                                       gchar *valueRule,
                                       xmlNodePtr xml_node);

/**
 * Free a RiskProfileData structure
 *
 * @param data The RiskProfileData to free
 */
void risk_profile_data_free(RiskProfileData *data);

/**
 * Determine if profile_id2 is a child of profile_id1
 * Based on prefix matching:
 * - Parent ends with 0000 (e.g., RI0100100000)
 * - Child has same prefix but different last 4 digits (e.g., RI0100100100)
 *
 * @param parent_id The potential parent Profile_ID
 * @param child_id The potential child Profile_ID
 * @return TRUE if child_id is a child of parent_id, FALSE otherwise
 */
gboolean is_parent_child_relation(const gchar *parent_id, const gchar *child_id);

/**
 * Build a GNode tree from risk profile XML document
 * The tree structure is determined by Profile_ID hierarchy:
 * - Nodes ending with 0000 are parents
 * - Nodes with matching prefix are children
 *
 * @param doc The XML document containing RiskProfile elements
 * @return The root GNode of the tree, or NULL on error
 *         The tree must be freed with g_node_destroy() and data with
 *         g_node_traverse() + risk_profile_data_free()
 */
GNode *build_risk_profile_tree(xmlDocPtr doc);

/**
 * Find a node in the tree by Profile_ID
 *
 * @param root The root of the tree to search
 * @param profile_id The Profile_ID to find
 * @return The GNode containing the matching profile, or NULL if not found
 */
GNode *find_node_by_profile_id(GNode *root, const gchar *profile_id);

/**
 * Print the tree structure (for debugging)
 *
 * @param node The root node to print from
 * @param depth The current depth (use 0 for root)
 */
void print_risk_profile_tree(GNode *node, gint depth);

/**
 * Free all data in the tree
 * This should be called before g_node_destroy()
 *
 * @param root The root of the tree
 */
void free_risk_profile_tree_data(GNode *root);

#endif /* RISK_PROFILE_TREE_H */
