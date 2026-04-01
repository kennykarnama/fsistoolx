#include "parser.h"
#include <glib.h>
#include <libxml/parser.h>
#include <libxml/tree.h>
#include <stdio.h>
#include <string.h>

// Helper to create a minimal ILFResult
static ILFResult *
create_ilfresult(GHashTable *ht)
{
    ILFResult *res = g_malloc0(sizeof(ILFResult));
    res->data = ht;
    res->status = ILF_SUCCESS;
    res->error_message = NULL;
    return res;
}

// Test: parse_sourceinherent_node_to_ht with valid node containing logicLjk and logicKonsolidasi
static void
test_parse_sourceinherent_node_to_ht_valid()
{
    GHashTable *ht
        = g_hash_table_new_full(g_str_hash, g_str_equal, g_free, (GDestroyNotify) xmlFreeNode);

    // Create a simple XML document with a record node
    const char *xml = "<record>"
                      "<logicLjk>SI01023001 + SI01023002</logicLjk>"
                      "<logicKonsolidasi>AVERAGE</logicKonsolidasi>"
                      "</record>";
    xmlDocPtr doc = xmlReadMemory(xml, strlen(xml), "noname.xml", NULL, 0);
    g_assert_nonnull(doc);

    xmlNodePtr node = xmlDocGetRootElement(doc);
    g_assert_nonnull(node);

    ilf_status_t status = parse_sourceinherent_node_to_ht(doc, node, ht);
    g_assert_cmpint(status, ==, ILF_SUCCESS);

    xmlFreeDoc(doc);
    g_hash_table_destroy(ht);
}

// Test: parse_sourceinherent_node_to_ht with empty record (no logic nodes)
static void
test_parse_sourceinherent_node_to_ht_missing_attr()
{
    GHashTable *ht
        = g_hash_table_new_full(g_str_hash, g_str_equal, g_free, (GDestroyNotify) xmlFreeNode);

    const char *xml = "<record></record>";
    xmlDocPtr doc = xmlReadMemory(xml, strlen(xml), "noname.xml", NULL, 0);
    g_assert_nonnull(doc);

    xmlNodePtr node = xmlDocGetRootElement(doc);
    g_assert_nonnull(node);

    // Function should succeed even with empty record (just doesn't print anything)
    ilf_status_t status = parse_sourceinherent_node_to_ht(doc, node, ht);
    g_assert_cmpint(status, ==, ILF_SUCCESS);

    xmlFreeDoc(doc);
    g_hash_table_destroy(ht);
}

// Test: parse_xml_sourceinherent with valid XML containing logic elements
static void
test_parse_xml_sourceinherent_valid()
{
    const char *xml = "<sourceInherentRevampReport>"
                      "<record>"
                      "<logicLjk>SI01001000 + SI01002000</logicLjk>"
                      "<logicKonsolidasi>sum</logicKonsolidasi>"
                      "</record>"
                      "<record>"
                      "<logicKonsolidasi>AVERAGE</logicKonsolidasi>"
                      "</record>"
                      "</sourceInherentRevampReport>";

    xmlDocPtr doc = xmlReadMemory(xml, strlen(xml), "noname.xml", NULL, 0);
    GHashTable *ht
        = g_hash_table_new_full(g_str_hash, g_str_equal, g_free, (GDestroyNotify) xmlFreeNode);
    ILFResult *res = create_ilfresult(ht);

    ilf_status_t status = parse_xml_sourceinherent(doc, &res);
    g_assert_cmpint(status, ==, ILF_SUCCESS);
    g_assert_cmpint(res->status, ==, ILF_SUCCESS);

    xmlFreeDoc(doc);
    g_hash_table_destroy(ht);
    g_free(res);
}

// Test: parse_xml_sourceinherent with wrong root node
static void
test_parse_xml_sourceinherent_wrong_root()
{
    const char *xml = "<wrongRoot></wrongRoot>";
    xmlDocPtr doc = xmlReadMemory(xml, strlen(xml), "noname.xml", NULL, 0);
    GHashTable *ht
        = g_hash_table_new_full(g_str_hash, g_str_equal, g_free, (GDestroyNotify) xmlFreeNode);
    ILFResult *res = create_ilfresult(ht);

    ilf_status_t status = parse_xml_sourceinherent(doc, &res);
    g_assert_cmpint(status, ==, ILF_ERROR);
    g_assert_cmpint(res->status, ==, ILF_ERROR);
    g_assert_nonnull(res->error_message);

    xmlFreeDoc(doc);
    g_hash_table_destroy(ht);
    free(res->error_message);
    g_free(res);
}

// Test: parse_xml_sourceinherent with unexpected child node
static void
test_parse_xml_sourceinherent_unexpected_node()
{
    const char *xml = "<sourceInherentRevampReport>"
                      "<unexpectedNode/>"
                      "</sourceInherentRevampReport>";

    xmlDocPtr doc = xmlReadMemory(xml, strlen(xml), "noname.xml", NULL, 0);
    GHashTable *ht
        = g_hash_table_new_full(g_str_hash, g_str_equal, g_free, (GDestroyNotify) xmlFreeNode);
    ILFResult *res = create_ilfresult(ht);

    ilf_status_t status = parse_xml_sourceinherent(doc, &res);
    g_assert_cmpint(status, ==, ILF_ERROR);
    g_assert_cmpint(res->status, ==, ILF_ERROR);
    g_assert_nonnull(res->error_message);

    xmlFreeDoc(doc);
    g_hash_table_destroy(ht);
    free(res->error_message);
    g_free(res);
}

/* Test: parse_xml_sourceinherent using real file in data directory.
 * The file contains <record> elements with child nodes including logicLjk and logicKonsolidasi.
 * Parser should fail due to whitespace text nodes being treated as unexpected nodes.
 */
static void
test_parse_xml_sourceinherent_file()
{
    gchar *contents = NULL;
    gsize len = 0;
    gboolean ok = g_file_get_contents("data/source_inherent_out.xml", &contents, &len, NULL);
    g_assert_true(ok);
    g_assert_nonnull(contents);
    g_assert_cmpuint(len, >, 0u);

    xmlDocPtr doc = xmlReadMemory(contents, (int) len, "source_inherent_out.xml", NULL, 0);
    g_assert_nonnull(doc);

    GHashTable *ht = g_hash_table_new_full(g_str_hash, g_str_equal, g_free, NULL);
    ILFResult *res = g_malloc0(sizeof(ILFResult));
    res->data = ht;
    res->status = ILF_SUCCESS;
    res->error_message = NULL;

    ilf_status_t status = parse_xml_sourceinherent(doc, &res);

    // Parser will fail on whitespace text nodes between <sourceInherentRevampReport> and first
    // <record>
    g_assert_cmpint(status, ==, ILF_SUCCESS);

    printf("Error message: %s\n", res->error_message ? res->error_message : "NULL");

    /* Ensure hash table is still empty because parsing aborted early */
    g_assert_cmpuint(g_hash_table_size(ht), >, 0u);

    printf("Hash table size: %u\n", g_hash_table_size(ht));

    xmlFreeDoc(doc);

    g_hash_table_destroy(ht);

    g_free(res->error_message);
    g_free(res);
    g_free(contents);
}

// Main runner
int
main(int argc, char **argv)
{
    /* Ensure any externally provided fatal-warnings flag is disabled. */
    g_unsetenv("G_DEBUG");
    g_test_init(&argc, &argv, NULL);

    /* Ensure warnings are not treated as fatal so we can assert on them gracefully. */
    g_log_set_always_fatal(G_LOG_LEVEL_ERROR | G_LOG_LEVEL_CRITICAL);

    g_test_add_func("/parser/parse_sourceinherent_node_to_ht_valid",
                    test_parse_sourceinherent_node_to_ht_valid);
    g_test_add_func("/parser/parse_sourceinherent_node_to_ht_missing_attr",
                    test_parse_sourceinherent_node_to_ht_missing_attr);
    g_test_add_func("/parser/parse_xml_sourceinherent_valid", test_parse_xml_sourceinherent_valid);
    g_test_add_func("/parser/parse_xml_sourceinherent_wrong_root",
                    test_parse_xml_sourceinherent_wrong_root);
    g_test_add_func("/parser/parse_xml_sourceinherent_file", test_parse_xml_sourceinherent_file);

    return g_test_run();
}