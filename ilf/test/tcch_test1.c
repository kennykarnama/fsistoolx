/* test_tcch.c - GLib test suite for tcch.c
 *
 * This file is part of the ILF project.
 *
 * SPDX-License-Identifier: MIT
 */

#include "../src/tcch.h"
#include <glib.h>

/* Test fixture for tcch tests */
typedef struct {
    TCCState *state;
    ILFResult result;
} TCCHFixture;

/* Setup function - called before each test */
static void
tcch_fixture_setup(TCCHFixture *fixture, gconstpointer user_data)
{
    fixture->state = tcc_new();
    g_assert_nonnull(fixture->state);

    /* Initialize result structure */
    fixture->result.status = ILF_SUCCESS;
    fixture->result.error_message = NULL;
    fixture->result.data = NULL;
}

/* Teardown function - called after each test */
static void
tcch_fixture_teardown(TCCHFixture *fixture, gconstpointer user_data)
{
    if (fixture->result.error_message) {
        free(fixture->result.error_message);
        fixture->result.error_message = NULL;
    }

    /* Note: result.data points to a compiled function in TCC's memory space.
     * It's managed by TCCState and should NOT be freed separately.
     * We must delete the TCCState last, after we're done using any symbols. */
    fixture->result.data = NULL;

    if (fixture->state) {
        tcc_delete(fixture->state);
        fixture->state = NULL;
    }
}

/* Test: Compile valid code */
static void
test_tcch_compile_valid_code(TCCHFixture *fixture, gconstpointer user_data)
{
    const char *valid_code
        = "#include <glib.h>\n"
          "#include<libxml/xmlmemory.h>\n"
          "#include<libxml/parser.h>\n"
          "#include<libxml/xpath.h>\n"
          "#include<libxml/xpathInternals.h>\n"
          "gdouble fx(xmlDocPtr doc, xmlNodePtr cur, gpointer user_data, gpointer result) {\n"
          "    return 42.0;\n"
          "}\n";

    ilf_status_t status = tcch_compile_code(valid_code, fixture->state, &fixture->result);

    g_assert_cmpint(status, ==, ILF_SUCCESS);
    g_assert_cmpint(fixture->result.status, ==, ILF_SUCCESS);
    g_assert_null(fixture->result.error_message);
    g_assert_nonnull(fixture->result.data);

    /* Verify the compiled function can be called and returns expected value */
    gdouble (*compiled_fx)(xmlDocPtr, xmlNodePtr, gpointer, gpointer) = fixture->result.data;
    gdouble result_val = compiled_fx(NULL, NULL, NULL, NULL);
    g_assert_cmpfloat(result_val, ==, 42.0);
}

/* Test: Compile code with syntax error */
static void
test_tcch_compile_syntax_error(TCCHFixture *fixture, gconstpointer user_data)
{
    const char *invalid_code
        = "#include <glib.h>\n"
          "#include<libxml/xmlmemory.h>\n"
          "#include<libxml/parser.h>\n"
          "#include<libxml/xpath.h>\n"
          "#include<libxml/xpathInternals.h>\n"
          "gdouble fx(xmlDocPtr doc, xmlNodePtr cur, gpointer user_data, gpointer result) {\n"
          "    return 42.0\n" /* Missing semicolon */
          "}\n";

    ilf_status_t status = tcch_compile_code(invalid_code, fixture->state, &fixture->result);

    g_assert_cmpint(status, ==, ILF_ERROR);
    g_assert_cmpint(fixture->result.status, ==, ILF_ERROR);
    g_assert_nonnull(fixture->result.error_message);
    g_assert_cmpstr(fixture->result.error_message, ==, "Compilation failed");
}

/* Test: Compile code without required function */
static void
test_tcch_compile_missing_fx_function(TCCHFixture *fixture, gconstpointer user_data)
{
    const char *code_without_fx = "#include <glib.h>\n"
                                  "#include<libxml/xmlmemory.h>\n"
                                  "#include<libxml/parser.h>\n"
                                  "#include<libxml/xpath.h>\n"
                                  "#include<libxml/xpathInternals.h>\n"
                                  "gdouble other_function(void) {\n"
                                  "    return 42.0;\n"
                                  "}\n";

    ilf_status_t status = tcch_compile_code(code_without_fx, fixture->state, &fixture->result);

    g_assert_cmpint(status, ==, ILF_ERROR);
    g_assert_cmpint(fixture->result.status, ==, ILF_ERROR);
    g_assert_nonnull(fixture->result.error_message);
    g_assert_cmpstr(fixture->result.error_message, ==, "Failed to get symbol 'fx'");
}

/* Test: NULL TCCState parameter */
static void
test_tcch_compile_null_state(TCCHFixture *fixture, gconstpointer user_data)
{
    const char *valid_code = "#include <glib.h>\n"
                             "gdouble fx(void) { return 42.0; }\n";

    ILFResult result = { 0 };
    ilf_status_t status = tcch_compile_code(valid_code, NULL, &result);

    g_assert_cmpint(status, ==, ILF_ERROR);
    g_assert_cmpint(result.status, ==, ILF_ERROR);
    g_assert_nonnull(result.error_message);
    g_assert_cmpstr(result.error_message, ==, "TCCState is NULL");

    /* Clean up */
    free(result.error_message);
}

/* Test: Empty code string */
static void
test_tcch_compile_empty_code(TCCHFixture *fixture, gconstpointer user_data)
{
    const char *empty_code = "";

    ilf_status_t status = tcch_compile_code(empty_code, fixture->state, &fixture->result);

    g_assert_cmpint(status, ==, ILF_ERROR);
    g_assert_cmpint(fixture->result.status, ==, ILF_ERROR);
    g_assert_nonnull(fixture->result.error_message);
}

/* Test: Code with wrong function signature */
static void
test_tcch_compile_wrong_fx_signature(TCCHFixture *fixture, gconstpointer user_data)
{
    const char *wrong_signature_code = "#include <glib.h>\n"
                                       "#include <libxml/parser.h>\n"
                                       "#include <libxml/tree.h>\n"
                                       "int fx(void) {\n" /* Wrong return type and parameters */
                                       "    return 42;\n"
                                       "}\n";

    ilf_status_t status = tcch_compile_code(wrong_signature_code, fixture->state, &fixture->result);

    /* This should compile successfully and return the symbol */
    /* TCC doesn't do strict type checking on retrieved symbols */
    g_assert_cmpint(status, ==, ILF_SUCCESS);
    g_assert_nonnull(fixture->result.data);
}

/* Test: Code with GLib usage */
static void
test_tcch_compile_with_glib_usage(TCCHFixture *fixture, gconstpointer user_data)
{
    const char *glib_code
        = "#include <glib.h>\n"
          "#include<libxml/xmlmemory.h>\n"
          "#include<libxml/parser.h>\n"
          "#include<libxml/xpath.h>\n"
          "#include<libxml/xpathInternals.h>\n"
          "gdouble fx(xmlDocPtr doc, xmlNodePtr cur, gpointer user_data, gpointer result) {\n"
          "    gchar *str = g_strdup(\"test\");\n"
          "    g_free(str);\n"
          "    return 3.14159;\n"
          "}\n";

    ilf_status_t status = tcch_compile_code(glib_code, fixture->state, &fixture->result);

    g_assert_cmpint(status, ==, ILF_SUCCESS);
    g_assert_cmpint(fixture->result.status, ==, ILF_SUCCESS);
    g_assert_null(fixture->result.error_message);
    g_assert_nonnull(fixture->result.data);

    /* Verify the compiled function can be called and returns expected value */
    gdouble (*compiled_fx)(xmlDocPtr, xmlNodePtr, gpointer, gpointer) = fixture->result.data;
    gdouble result_val = compiled_fx(NULL, NULL, NULL, NULL);
    g_assert_cmpfloat_with_epsilon(result_val, 3.14159, 0.00001);
}

/* Test: Code with XML parsing */
static void
test_tcch_compile_with_xml_usage(TCCHFixture *fixture, gconstpointer user_data)
{
    const char *xml_code
        = "#include <glib.h>\n"
          "#include<libxml/xmlmemory.h>\n"
          "#include<libxml/parser.h>\n"
          "#include<libxml/xpath.h>\n"
          "#include<libxml/xpathInternals.h>\n"
          "gdouble fx(xmlDocPtr doc, xmlNodePtr cur, gpointer user_data, gpointer result) {\n"
          "    if (doc && cur) {\n"
          "        xmlChar *content = xmlNodeGetContent(cur);\n"
          "        if (content) xmlFree(content);\n"
          "    }\n"
          "    return 1.0;\n"
          "}\n";

    ilf_status_t status = tcch_compile_code(xml_code, fixture->state, &fixture->result);

    g_assert_cmpint(status, ==, ILF_SUCCESS);
    g_assert_cmpint(fixture->result.status, ==, ILF_SUCCESS);
    g_assert_null(fixture->result.error_message);
    g_assert_nonnull(fixture->result.data);

    /* Verify the compiled function can be called */
    gdouble (*compiled_fx)(xmlDocPtr, xmlNodePtr, gpointer, gpointer) = fixture->result.data;
    gdouble result_val = compiled_fx(NULL, NULL, NULL, NULL);
    g_assert_cmpfloat(result_val, ==, 1.0);
}

/* Test: Error handler function */
static void
test_tcch_handle_error(void)
{
    /* Create a temporary file to capture error output */
    gchar *temp_filename = NULL;
    gint fd = g_file_open_tmp("tcch_test_XXXXXX", &temp_filename, NULL);
    g_assert_cmpint(fd, !=, -1);

    FILE *temp_file = fdopen(fd, "w+");
    g_assert_nonnull(temp_file);

    /* Call the error handler */
    const char *test_msg = "Test error message";
    tcch_handle_error(temp_file, test_msg);

    /* Flush and read back */
    fflush(temp_file);
    rewind(temp_file);

    gchar buffer[256];
    gchar *result = fgets(buffer, sizeof(buffer), temp_file);
    g_assert_nonnull(result);
    g_assert_true(g_str_has_prefix(buffer, "TCC Error:"));
    g_assert_true(strstr(buffer, test_msg) != NULL);

    /* Cleanup */
    fclose(temp_file);
    //g_unlink(temp_filename);
    g_free(temp_filename);
}

/* Main test runner */
int
main(int argc, char *argv[])
{
    g_test_init(&argc, &argv, NULL);

    /* Register tests with fixtures */
    g_test_add("/tcch/compile/valid_code", TCCHFixture, NULL, tcch_fixture_setup,
               test_tcch_compile_valid_code, tcch_fixture_teardown);

    g_test_add("/tcch/compile/syntax_error", TCCHFixture, NULL, tcch_fixture_setup,
               test_tcch_compile_syntax_error, tcch_fixture_teardown);

    g_test_add("/tcch/compile/missing_fx_function", TCCHFixture, NULL, tcch_fixture_setup,
               test_tcch_compile_missing_fx_function, tcch_fixture_teardown);

    g_test_add("/tcch/compile/null_state", TCCHFixture, NULL, tcch_fixture_setup,
               test_tcch_compile_null_state, tcch_fixture_teardown);

    g_test_add("/tcch/compile/empty_code", TCCHFixture, NULL, tcch_fixture_setup,
               test_tcch_compile_empty_code, tcch_fixture_teardown);

    g_test_add("/tcch/compile/wrong_fx_signature", TCCHFixture, NULL, tcch_fixture_setup,
               test_tcch_compile_wrong_fx_signature, tcch_fixture_teardown);

    g_test_add("/tcch/compile/with_glib_usage", TCCHFixture, NULL, tcch_fixture_setup,
               test_tcch_compile_with_glib_usage, tcch_fixture_teardown);

    g_test_add("/tcch/compile/with_xml_usage", TCCHFixture, NULL, tcch_fixture_setup,
               test_tcch_compile_with_xml_usage, tcch_fixture_teardown);

    /* Register simple test without fixture */
    g_test_add_func("/tcch/error_handler", test_tcch_handle_error);

    return g_test_run();
}
