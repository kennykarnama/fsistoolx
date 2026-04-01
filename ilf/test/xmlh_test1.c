#include <glib.h>
#include <libxml/parser.h>
#include <libxml/tree.h>
#include <libxml/xpath.h>
#include <string.h>

#include "xmlh.h"

/* Test fixture structure */
typedef struct {
    xmlDocPtr doc;
} XMLHFixture;

/* Setup function */
static void
xmlh_fixture_setup(XMLHFixture *fixture, gconstpointer user_data)
{
    (void) user_data;
    fixture->doc = NULL;
}

/* Teardown function */
static void
xmlh_fixture_teardown(XMLHFixture *fixture, gconstpointer user_data)
{
    (void) user_data;
    if (fixture->doc) {
        xmlFreeDoc(fixture->doc);
        fixture->doc = NULL;
    }
}

/* Test: nodeset_to_array_str with valid single-child element nodes */
static void
test_nodeset_to_array_str_valid_single_child(XMLHFixture *fixture, gconstpointer user_data)
{
    (void) user_data;

    const char *xml = "<?xml version=\"1.0\"?>"
                      "<root>"
                      "  <item><result>42.5</result></item>"
                      "  <item><result>10.0</result></item>"
                      "  <item><result>99.9</result></item>"
                      "</root>";

    fixture->doc = xmlReadMemory(xml, strlen(xml), "test.xml", NULL, 0);
    g_assert_nonnull(fixture->doc);

    xmlXPathContextPtr xpathCtx = xmlXPathNewContext(fixture->doc);
    g_assert_nonnull(xpathCtx);

    xmlXPathObjectPtr xpathObj = xmlXPathEvalExpression((const xmlChar *) "//item", xpathCtx);
    g_assert_nonnull(xpathObj);
    g_assert_nonnull(xpathObj->nodesetval);
    g_assert_cmpint(xpathObj->nodesetval->nodeNr, ==, 3);

    GArray *result_array = NULL;
    ilf_status_t status = nodeset_to_array_str(fixture->doc, xpathObj->nodesetval, &result_array);

    g_assert_cmpint(status, ==, ILF_SUCCESS);
    g_assert_nonnull(result_array);
    g_assert_cmpint(result_array->len, ==, 3);

    // Verify the extracted values
    gchar *val0 = g_array_index(result_array, gchar *, 0);
    gchar *val1 = g_array_index(result_array, gchar *, 1);
    gchar *val2 = g_array_index(result_array, gchar *, 2);

    g_assert_cmpstr(val0, ==, "42.5");
    g_assert_cmpstr(val1, ==, "10.0");
    g_assert_cmpstr(val2, ==, "99.9");

    // Cleanup
    for (guint i = 0; i < result_array->len; i++) {
        g_free(g_array_index(result_array, gchar *, i));
    }
    g_array_free(result_array, TRUE);
    xmlXPathFreeObject(xpathObj);
    xmlXPathFreeContext(xpathCtx);
}

/* Test: nodeset_to_array_str with NULL nodeset */
static void
test_nodeset_to_array_str_null_nodeset_subprocess(void)
{
    GArray *result_array = NULL;
    // This will trigger g_error() which aborts
    nodeset_to_array_str(NULL, NULL, &result_array);
}

static void
test_nodeset_to_array_str_null_nodeset(XMLHFixture *fixture, gconstpointer user_data)
{
    (void) fixture;
    (void) user_data;

    g_test_trap_subprocess("/xmlh/nodeset_to_array_str/null_nodeset/subprocess", 0, 0);
    g_test_trap_assert_failed();
    g_test_trap_assert_stderr("*Invalid arguments to nodeset_to_array*");
}

/* Test: nodeset_to_array_str with NULL out_array */
static void
test_nodeset_to_array_str_null_out_array_subprocess(void)
{
    const char *xml = "<?xml version=\"1.0\"?>"
                      "<root><item><result>test</result></item></root>";

    xmlDocPtr doc = xmlReadMemory(xml, strlen(xml), "test.xml", NULL, 0);
    xmlXPathContextPtr xpathCtx = xmlXPathNewContext(doc);
    xmlXPathObjectPtr xpathObj = xmlXPathEvalExpression((const xmlChar *) "//item", xpathCtx);

    // This will trigger g_error() which aborts
    nodeset_to_array_str(doc, xpathObj->nodesetval, NULL);
}

static void
test_nodeset_to_array_str_null_out_array(XMLHFixture *fixture, gconstpointer user_data)
{
    (void) fixture;
    (void) user_data;

    g_test_trap_subprocess("/xmlh/nodeset_to_array_str/null_out_array/subprocess", 0, 0);
    g_test_trap_assert_failed();
    g_test_trap_assert_stderr("*Invalid arguments to nodeset_to_array*");
}

/* Test: nodeset_to_array_str with non-element node (text node) */
static void
test_nodeset_to_array_str_non_element_node_subprocess(void)
{
    const char *xml = "<?xml version=\"1.0\"?>"
                      "<root>text content</root>";

    xmlDocPtr doc = xmlReadMemory(xml, strlen(xml), "test.xml", NULL, 0);
    xmlXPathContextPtr xpathCtx = xmlXPathNewContext(doc);
    xmlXPathObjectPtr xpathObj = xmlXPathEvalExpression((const xmlChar *) "//text()", xpathCtx);

    GArray *result_array = NULL;
    // This will trigger g_error() which aborts
    nodeset_to_array_str(doc, xpathObj->nodesetval, &result_array);
}

static void
test_nodeset_to_array_str_non_element_node(XMLHFixture *fixture, gconstpointer user_data)
{
    (void) fixture;
    (void) user_data;

    g_test_trap_subprocess("/xmlh/nodeset_to_array_str/non_element_node/subprocess", 0, 0);
    g_test_trap_assert_failed();
    g_test_trap_assert_stderr("*Node is not of type XML_ELEMENT_NODE*");
}

/* Test: nodeset_to_array_str with empty result element */
static void
test_nodeset_to_array_str_empty_result(XMLHFixture *fixture, gconstpointer user_data)
{
    (void) user_data;

    const char *xml = "<?xml version=\"1.0\"?>"
                      "<root>"
                      "  <item><result></result></item>"
                      "  <item><result>10.0</result></item>"
                      "</root>";

    fixture->doc = xmlReadMemory(xml, strlen(xml), "test.xml", NULL, 0);
    g_assert_nonnull(fixture->doc);

    xmlXPathContextPtr xpathCtx = xmlXPathNewContext(fixture->doc);
    xmlXPathObjectPtr xpathObj = xmlXPathEvalExpression((const xmlChar *) "//item", xpathCtx);

    GArray *result_array = NULL;
    ilf_status_t status = nodeset_to_array_str(fixture->doc, xpathObj->nodesetval, &result_array);

    g_assert_cmpint(status, ==, ILF_SUCCESS);
    g_assert_nonnull(result_array);
    // Should only have one element (the non-empty one)
    g_assert_cmpint(result_array->len, ==, 1);

    gchar *val0 = g_array_index(result_array, gchar *, 0);
    g_assert_cmpstr(val0, ==, "10.0");

    g_free(val0);
    g_array_free(result_array, TRUE);
    xmlXPathFreeObject(xpathObj);
    xmlXPathFreeContext(xpathCtx);
}

/* Test: nodeset_to_array_str with missing result child */
static void
test_nodeset_to_array_str_missing_result_child(XMLHFixture *fixture, gconstpointer user_data)
{
    (void) user_data;

    const char *xml = "<?xml version=\"1.0\"?>"
                      "<root>"
                      "  <item><other>value</other></item>"
                      "</root>";

    fixture->doc = xmlReadMemory(xml, strlen(xml), "test.xml", NULL, 0);
    g_assert_nonnull(fixture->doc);

    xmlXPathContextPtr xpathCtx = xmlXPathNewContext(fixture->doc);
    xmlXPathObjectPtr xpathObj = xmlXPathEvalExpression((const xmlChar *) "//item", xpathCtx);

    GArray *result_array = NULL;
    ilf_status_t status = nodeset_to_array_str(fixture->doc, xpathObj->nodesetval, &result_array);

    g_assert_cmpint(status, ==, ILF_SUCCESS);
    g_assert_nonnull(result_array);
    // No result child found, so array should be empty
    g_assert_cmpint(result_array->len, ==, 0);

    g_array_free(result_array, TRUE);
    xmlXPathFreeObject(xpathObj);
    xmlXPathFreeContext(xpathCtx);
}

/* Integration test: Read from updated_pic.xml and extract results */
static void
test_nodeset_to_array_str_from_updated_pic(XMLHFixture *fixture, gconstpointer user_data)
{
    (void) user_data;

    // Read the actual XML file
    fixture->doc = xmlReadFile("data/updated_pic.xml", NULL, 0);
    g_assert_nonnull(fixture->doc);

    // Use XPath to find all sourceInherentEvalResult parent nodes
    xmlXPathContextPtr xpathCtx = xmlXPathNewContext(fixture->doc);
    g_assert_nonnull(xpathCtx);

    xmlXPathObjectPtr xpathObj
        = xmlXPathEvalExpression((const xmlChar *) "//sourceInherentEvalResult", xpathCtx);
    g_assert_nonnull(xpathObj);
    g_assert_nonnull(xpathObj->nodesetval);

    // Should have multiple sourceInherentEvalResult nodes
    int node_count = xpathObj->nodesetval->nodeNr;
    g_assert_cmpint(node_count, >, 0);

    printf("Found %d sourceInherentEvalResult nodes\n", node_count);

    // Use nodeset_to_array_str to extract result children
    GArray *result_array = NULL;
    ilf_status_t status = nodeset_to_array_str(fixture->doc, xpathObj->nodesetval, &result_array);

    g_assert_cmpint(status, ==, ILF_SUCCESS);
    g_assert_nonnull(result_array);
    g_assert_cmpint(result_array->len, >, 0);

    // Print first few results for verification
    printf("Extracted %u result values:\n", result_array->len);
    for (guint i = 0; i < MIN(5, result_array->len); i++) {
        gchar *val = g_array_index(result_array, gchar *, i);
        printf("  Result[%u]: %s\n", i, val);
    }

    // Cleanup
    for (guint i = 0; i < result_array->len; i++) {
        g_free(g_array_index(result_array, gchar *, i));
    }
    g_array_free(result_array, TRUE);
    xmlXPathFreeObject(xpathObj);
    xmlXPathFreeContext(xpathCtx);
}

int
main(int argc, char **argv)
{
    g_test_init(&argc, &argv, NULL);

    // Suppress expected error messages to avoid cluttering test output
    g_log_set_always_fatal(G_LOG_LEVEL_CRITICAL);

    g_test_add("/xmlh/nodeset_to_array_str/valid_single_child", XMLHFixture, NULL,
               xmlh_fixture_setup, test_nodeset_to_array_str_valid_single_child,
               xmlh_fixture_teardown);

    g_test_add_func("/xmlh/nodeset_to_array_str/null_nodeset/subprocess",
                    test_nodeset_to_array_str_null_nodeset_subprocess);
    g_test_add("/xmlh/nodeset_to_array_str/null_nodeset", XMLHFixture, NULL, xmlh_fixture_setup,
               test_nodeset_to_array_str_null_nodeset, xmlh_fixture_teardown);

    g_test_add_func("/xmlh/nodeset_to_array_str/null_out_array/subprocess",
                    test_nodeset_to_array_str_null_out_array_subprocess);
    g_test_add("/xmlh/nodeset_to_array_str/null_out_array", XMLHFixture, NULL, xmlh_fixture_setup,
               test_nodeset_to_array_str_null_out_array, xmlh_fixture_teardown);

    g_test_add_func("/xmlh/nodeset_to_array_str/non_element_node/subprocess",
                    test_nodeset_to_array_str_non_element_node_subprocess);
    g_test_add("/xmlh/nodeset_to_array_str/non_element_node", XMLHFixture, NULL, xmlh_fixture_setup,
               test_nodeset_to_array_str_non_element_node, xmlh_fixture_teardown);

    g_test_add("/xmlh/nodeset_to_array_str/empty_result", XMLHFixture, NULL, xmlh_fixture_setup,
               test_nodeset_to_array_str_empty_result, xmlh_fixture_teardown);

    g_test_add("/xmlh/nodeset_to_array_str/missing_result_child", XMLHFixture, NULL,
               xmlh_fixture_setup, test_nodeset_to_array_str_missing_result_child,
               xmlh_fixture_teardown);

    g_test_add("/xmlh/nodeset_to_array_str/from_updated_pic", XMLHFixture, NULL, xmlh_fixture_setup,
               test_nodeset_to_array_str_from_updated_pic, xmlh_fixture_teardown);

    return g_test_run();
}
