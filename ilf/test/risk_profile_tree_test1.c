#include "risk_profile_tree.h"
#include <glib.h>
#include <libxml/parser.h>

static void
test_is_parent_child_relation(void)
{
    // Test valid parent-child relationship (2 levels)
    g_assert_true(is_parent_child_relation("RI0100100000", "RI0100100100"));
    g_assert_true(is_parent_child_relation("RI0100100000", "RI0100100200"));
    g_assert_true(is_parent_child_relation("RI0100200000", "RI0100200100"));

    // Test valid parent-child relationship (3 levels)
    g_assert_true(is_parent_child_relation("RI0100300100", "RI0100300101"));
    g_assert_true(is_parent_child_relation("RI0100300100", "RI0100300102"));
    g_assert_true(is_parent_child_relation("RI0100300000", "RI0100300100"));

    // Test invalid relationships (different branches)
    g_assert_false(is_parent_child_relation("RI0100100000", "RI0100200100"));

    // Test invalid relationships (same node)
    g_assert_false(is_parent_child_relation("RI0100100000", "RI0100100000"));

    // Test invalid relationships (sibling, not parent-child)
    g_assert_false(is_parent_child_relation("RI0100100100", "RI0100100200"));

    // Test invalid relationships (grandparent-grandchild, not direct parent-child)
    g_assert_false(is_parent_child_relation("RI0100300000", "RI0100300101"));

    // Test NULL values
    g_assert_false(is_parent_child_relation(NULL, "RI0100100100"));
    g_assert_false(is_parent_child_relation("RI0100100000", NULL));
}

static void
test_risk_profile_data_new_free(void)
{
    RiskProfileData *data
        = risk_profile_data_new("RI0100100000", "Risiko Kredit", "Test Factor", NULL);

    g_assert_nonnull(data);
    g_assert_cmpstr(data->profile_id, ==, "RI0100100000");
    g_assert_cmpstr(data->risiko_name, ==, "Risiko Kredit");
    g_assert_cmpstr(data->faktor_penilaian, ==, "Test Factor");
    g_assert_null(data->xml_node);

    risk_profile_data_free(data);

    // Test with NULL values
    data = risk_profile_data_new(NULL, NULL, NULL, NULL);
    g_assert_nonnull(data);
    risk_profile_data_free(data);

    // Test free with NULL
    risk_profile_data_free(NULL);
}

static void
test_build_risk_profile_tree(void)
{
    xmlDocPtr doc = xmlReadFile("data/risk_profile_report_items.xml", NULL, XML_PARSE_NOBLANKS);
    g_assert_nonnull(doc);

    GNode *root = build_risk_profile_tree(doc);
    g_assert_nonnull(root);

    // The root should be a virtual root with NULL data
    g_assert_null(root->data);

    // Should have children (the actual root nodes)
    g_assert_nonnull(root->children);
    g_assert_cmpuint(g_node_n_children(root), >, 0);

    // Print the tree structure for visual inspection
    g_print("\n=== Risk Profile Tree Structure ===\n");
    print_risk_profile_tree(root, 0);
    g_print("===================================\n\n");

    // Count total nodes
    guint total_nodes = g_node_n_nodes(root, G_TRAVERSE_ALL);
    g_print("Total nodes in tree: %u\n", total_nodes);

    // Find a specific node
    GNode *found = find_node_by_profile_id(root, "RI0100100000");
    g_assert_nonnull(found);
    g_assert_nonnull(found->data);

    RiskProfileData *data = (RiskProfileData *) found->data;
    g_assert_cmpstr(data->profile_id, ==, "RI0100100000");
    g_print("Found node: %s - %s\n", data->profile_id,
            data->faktor_penilaian ? data->faktor_penilaian : "(no factor)");

    // Check that it has children
    g_assert_nonnull(found->children);
    guint n_children = g_node_n_children(found);
    g_print("Node RI0100100000 has %u children\n", n_children);
    g_assert_cmpuint(n_children, >, 0);

    // Find a child node
    GNode *child_found = find_node_by_profile_id(root, "RI0100100100");
    g_assert_nonnull(child_found);
    g_assert_nonnull(child_found->data);

    RiskProfileData *child_data = (RiskProfileData *) child_found->data;
    g_assert_cmpstr(child_data->profile_id, ==, "RI0100100100");

    // Verify parent-child relationship
    g_assert_true(child_found->parent == found);
    g_print("Node RI0100100100 is correctly a child of RI0100100000\n");

    // Test finding non-existent node
    GNode *not_found = find_node_by_profile_id(root, "RI9999999999");
    g_assert_null(not_found);

    // Cleanup
    free_risk_profile_tree_data(root);
    g_node_destroy(root);
    xmlFreeDoc(doc);
}

static void
test_build_risk_profile_tree_null_doc(void)
{
    GNode *root = build_risk_profile_tree(NULL);
    g_assert_null(root);
}

static void
test_find_node_by_profile_id_null(void)
{
    GNode *result = find_node_by_profile_id(NULL, "RI0100100000");
    g_assert_null(result);

    GNode *dummy = g_node_new(NULL);
    result = find_node_by_profile_id(dummy, NULL);
    g_assert_null(result);
    g_node_destroy(dummy);
}

int
main(int argc, char **argv)
{
    g_test_init(&argc, &argv, NULL);

    g_test_add_func("/risk_profile_tree/is_parent_child_relation", test_is_parent_child_relation);
    g_test_add_func("/risk_profile_tree/data_new_free", test_risk_profile_data_new_free);
    g_test_add_func("/risk_profile_tree/build_tree", test_build_risk_profile_tree);
    g_test_add_func("/risk_profile_tree/build_tree_null_doc",
                    test_build_risk_profile_tree_null_doc);
    g_test_add_func("/risk_profile_tree/find_node_null", test_find_node_by_profile_id_null);

    return g_test_run();
}
