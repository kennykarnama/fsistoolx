#ifndef KPMR_SOURCE_TREE_H
#define KPMR_SOURCE_TREE_H

#include <glib.h>
#include <libxml/parser.h>
#include <libxml/tree.h>

/**
 * Structure to hold KPMR Source node data in the tree
 */
typedef struct {
    gchar *code;
    gchar *risk_id;
    gchar *assesment_factor;
    gchar *pic;
    guint32 numeric_id;
    guint32 value;
    gchar *remark;
    xmlNodePtr xml_node; // Reference to the original XML node
} KpmrSourceData;

/**
 * Create a new KpmrSourceData structure
 *
 * @param code The code value (identifier)
 * @param risk_id The risk_id value
 * @param assesment_factor The assesment_factor value
 * @param pic The pic JSON value
 * @param numeric_id The numeric_id value
 * @param xml_node The XML node reference
 * @return A newly allocated KpmrSourceData structure
 */
KpmrSourceData *kpmr_source_data_new(const gchar *code, const gchar *risk_id,
                                     const gchar *assesment_factor, const gchar *pic,
                                     guint32 numeric_id,
                                     guint32 value,
                                     gchar *remark,
                                     xmlNodePtr xml_node);

/**
 * Free a KpmrSourceData structure
 *
 * @param data The KpmrSourceData to free
 */
void kpmr_source_data_free(KpmrSourceData *data);

/**
 * Determine if code2 is a child of code1
 * Based on prefix matching (same logic as risk_profile_tree):
 * - Parent ends with 000 (e.g., SK01001000)
 * - Child has same prefix but different last digits (e.g., SK01001001)
 *
 * @param parent_code The potential parent code
 * @param child_code The potential child code
 * @return TRUE if child_code is a child of parent_code, FALSE otherwise
 */
gboolean kpmr_is_parent_child_relation(const gchar *parent_code, const gchar *child_code);

/**
 * Build a GNode tree from KPMR source XML document
 * The tree structure is determined by code hierarchy:
 * - Nodes ending with 000 are parents
 * - Nodes with matching prefix are children
 *
 * @param doc The XML document containing DATA_RECORD elements
 * @return The root GNode of the tree, or NULL on error
 *         The tree must be freed with g_node_destroy() and data with
 *         g_node_traverse() + kpmr_source_data_free()
 */
GNode *build_kpmr_source_tree(xmlDocPtr doc);

/**
 * Find a node in the tree by code
 *
 * @param root The root of the tree to search
 * @param code The code to find
 * @return The GNode containing the matching KPMR source, or NULL if not found
 */
GNode *find_kpmr_node_by_code(GNode *root, const gchar *code);

/**
 * Print the tree structure (for debugging)
 *
 * @param node The root node to print from
 * @param depth The current depth (use 0 for root)
 */
void print_kpmr_source_tree(GNode *node, gint depth);

/**
 * Free all data in the tree
 * This should be called before g_node_destroy()
 *
 * @param root The root of the tree
 */
void free_kpmr_source_tree_data(GNode *root);

#endif /* KPMR_SOURCE_TREE_H */
