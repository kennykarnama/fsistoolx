#include <glib.h>
#include <gsl/gsl_vector.h>
#include <libxml/parser.h>
#include <libxml/tree.h>
#include <libxml/xpath.h>
#include <math.h>

#include "gslh.h"
#include "xmlh.h"

/* Test fixture structure */
typedef struct {
    GArray *array;
} GSLHFixture;

/* Setup function */
static void
gslh_fixture_setup(GSLHFixture *fixture, gconstpointer user_data)
{
    (void) user_data;
    fixture->array = NULL;
}

/* Teardown function */
static void
gslh_fixture_teardown(GSLHFixture *fixture, gconstpointer user_data)
{
    (void) user_data;
    if (fixture->array) {
        g_array_free(fixture->array, TRUE);
        fixture->array = NULL;
    }
}

/* Test: garraydouble_gsl_vector with valid array */
static void
test_garraydouble_gsl_vector_valid(GSLHFixture *fixture, gconstpointer user_data)
{
    (void) user_data;

    // Create a GArray with some test values
    fixture->array = g_array_new(FALSE, FALSE, sizeof(double));
    double values[] = { 1.5, 2.7, 3.14159, -5.0, 100.25 };
    for (size_t i = 0; i < sizeof(values) / sizeof(values[0]); i++) {
        g_array_append_val(fixture->array, values[i]);
    }

    gsl_vector *result_vector = NULL;
    ilf_status_t status = garraydouble_gsl_vector(fixture->array, &result_vector);

    g_assert_cmpint(status, ==, ILF_SUCCESS);
    g_assert_nonnull(result_vector);
    g_assert_cmpuint(result_vector->size, ==, fixture->array->len);

    // Verify the values match
    for (guint i = 0; i < fixture->array->len; i++) {
        double expected = g_array_index(fixture->array, double, i);
        double actual = gsl_vector_get(result_vector, i);
        g_assert_cmpfloat_with_epsilon(actual, expected, 0.000001);
    }

    gsl_vector_free(result_vector);
}

/* Test: garraydouble_gsl_vector with empty array */
static void
test_garraydouble_gsl_vector_empty(GSLHFixture *fixture, gconstpointer user_data)
{
    (void) user_data;

    fixture->array = g_array_new(FALSE, FALSE, sizeof(double));

    gsl_vector *result_vector = NULL;
    ilf_status_t status = garraydouble_gsl_vector(fixture->array, &result_vector);

    g_assert_cmpint(status, ==, ILF_SUCCESS);
    g_assert_nonnull(result_vector);
    g_assert_cmpuint(result_vector->size, ==, 0);

    gsl_vector_free(result_vector);
}

/* Test: garraydouble_gsl_vector with single element */
static void
test_garraydouble_gsl_vector_single_element(GSLHFixture *fixture, gconstpointer user_data)
{
    (void) user_data;

    fixture->array = g_array_new(FALSE, FALSE, sizeof(double));
    double value = 42.42;
    g_array_append_val(fixture->array, value);

    gsl_vector *result_vector = NULL;
    ilf_status_t status = garraydouble_gsl_vector(fixture->array, &result_vector);

    g_assert_cmpint(status, ==, ILF_SUCCESS);
    g_assert_nonnull(result_vector);
    g_assert_cmpuint(result_vector->size, ==, 1);
    g_assert_cmpfloat_with_epsilon(gsl_vector_get(result_vector, 0), 42.42, 0.000001);

    gsl_vector_free(result_vector);
}

/* Test: garraydouble_gsl_vector with large array */
static void
test_garraydouble_gsl_vector_large_array(GSLHFixture *fixture, gconstpointer user_data)
{
    (void) user_data;

    fixture->array = g_array_new(FALSE, FALSE, sizeof(double));

    // Add 1000 elements
    for (int i = 0; i < 1000; i++) {
        double value = (double) i * 0.5;
        g_array_append_val(fixture->array, value);
    }

    gsl_vector *result_vector = NULL;
    ilf_status_t status = garraydouble_gsl_vector(fixture->array, &result_vector);

    g_assert_cmpint(status, ==, ILF_SUCCESS);
    g_assert_nonnull(result_vector);
    g_assert_cmpuint(result_vector->size, ==, 1000);

    // Spot check a few values
    g_assert_cmpfloat_with_epsilon(gsl_vector_get(result_vector, 0), 0.0, 0.000001);
    g_assert_cmpfloat_with_epsilon(gsl_vector_get(result_vector, 500), 250.0, 0.000001);
    g_assert_cmpfloat_with_epsilon(gsl_vector_get(result_vector, 999), 499.5, 0.000001);

    gsl_vector_free(result_vector);
}

/* Test: garraydouble_gsl_vector with NULL array */
static void
test_garraydouble_gsl_vector_null_array_subprocess(void)
{
    gsl_vector *result_vector = NULL;
    // This will trigger g_error() which aborts
    garraydouble_gsl_vector(NULL, &result_vector);
}

static void
test_garraydouble_gsl_vector_null_array(GSLHFixture *fixture, gconstpointer user_data)
{
    (void) fixture;
    (void) user_data;

    g_test_trap_subprocess("/gslh/garraydouble_gsl_vector/null_array/subprocess", 0, 0);
    g_test_trap_assert_failed();
    g_test_trap_assert_stderr("*Invalid arguments to garraydouble_gsl_vector*");
}

/* Test: garraydouble_gsl_vector with NULL out_vector */
static void
test_garraydouble_gsl_vector_null_out_vector_subprocess(void)
{
    GArray *array = g_array_new(FALSE, FALSE, sizeof(double));
    double value = 1.0;
    g_array_append_val(array, value);

    // This will trigger g_error() which aborts
    garraydouble_gsl_vector(array, NULL);
}

static void
test_garraydouble_gsl_vector_null_out_vector(GSLHFixture *fixture, gconstpointer user_data)
{
    (void) fixture;
    (void) user_data;

    g_test_trap_subprocess("/gslh/garraydouble_gsl_vector/null_out_vector/subprocess", 0, 0);
    g_test_trap_assert_failed();
    g_test_trap_assert_stderr("*Invalid arguments to garraydouble_gsl_vector*");
}

/* Test: garraydouble_gsl_vector with special values (NaN, Inf) */
static void
test_garraydouble_gsl_vector_special_values(GSLHFixture *fixture, gconstpointer user_data)
{
    (void) user_data;

    fixture->array = g_array_new(FALSE, FALSE, sizeof(double));
    double values[] = { INFINITY, -INFINITY, NAN, 0.0, -0.0 };
    for (size_t i = 0; i < sizeof(values) / sizeof(values[0]); i++) {
        g_array_append_val(fixture->array, values[i]);
    }

    gsl_vector *result_vector = NULL;
    ilf_status_t status = garraydouble_gsl_vector(fixture->array, &result_vector);

    g_assert_cmpint(status, ==, ILF_SUCCESS);
    g_assert_nonnull(result_vector);
    g_assert_cmpuint(result_vector->size, ==, fixture->array->len);

    // Verify special values
    g_assert_true(isinf(gsl_vector_get(result_vector, 0)) && gsl_vector_get(result_vector, 0) > 0);
    g_assert_true(isinf(gsl_vector_get(result_vector, 1)) && gsl_vector_get(result_vector, 1) < 0);
    g_assert_true(isnan(gsl_vector_get(result_vector, 2)));
    g_assert_cmpfloat_with_epsilon(gsl_vector_get(result_vector, 3), 0.0, 0.000001);
    g_assert_cmpfloat_with_epsilon(gsl_vector_get(result_vector, 4), -0.0, 0.000001);

    gsl_vector_free(result_vector);
}

/* Integration test: Read from updated_pic.xml, extract results, convert to GSL vector */
static void
test_garraydouble_gsl_vector_from_updated_pic(GSLHFixture *fixture, gconstpointer user_data)
{
    (void) user_data;
    (void) fixture;

    // Read the XML file
    xmlDocPtr doc = xmlReadFile("data/updated_pic.xml", NULL, 0);
    g_assert_nonnull(doc);

    // Use XPath to find all result element nodes
    xmlXPathContextPtr xpathCtx = xmlXPathNewContext(doc);
    g_assert_nonnull(xpathCtx);

    xmlXPathObjectPtr xpathObj
        = xmlXPathEvalExpression((const xmlChar *) "//sourceInherentEvalResult/result", xpathCtx);
    g_assert_nonnull(xpathObj);
    g_assert_nonnull(xpathObj->nodesetval);

    int node_count = xpathObj->nodesetval->nodeNr;
    g_assert_cmpint(node_count, >, 0);

    printf("Found %d result nodes\n", node_count);

    // Extract text content directly from result nodes
    GArray *result_strings = g_array_new(FALSE, FALSE, sizeof(gchar *));
    for (int i = 0; i < node_count; i++) {
        xmlNodePtr node = xpathObj->nodesetval->nodeTab[i];
        xmlChar *content = xmlNodeGetContent(node);
        if (content) {
            gchar *str = g_strdup((const char *) content);
            g_array_append_val(result_strings, str);
            xmlFree(content);
        }
    }

    g_assert_cmpint(result_strings->len, >, 0);
    printf("Extracted %u result strings\n", result_strings->len);

    // Convert strings to doubles
    GArray *double_array = g_array_new(FALSE, FALSE, sizeof(double));
    for (guint i = 0; i < result_strings->len; i++) {
        gchar *str = g_array_index(result_strings, gchar *, i);
        double value = g_ascii_strtod(str, NULL);
        g_array_append_val(double_array, value);
        printf("  Result[%u]: %s -> %f\n", i, str, value);
    }

    // Convert to GSL vector
    gsl_vector *result_vector = NULL;
    ilf_status_t status = garraydouble_gsl_vector(double_array, &result_vector);

    g_assert_cmpint(status, ==, ILF_SUCCESS);
    g_assert_nonnull(result_vector);
    g_assert_cmpuint(result_vector->size, ==, double_array->len);

    // Verify a few values
    printf("GSL Vector created with %zu elements\n", result_vector->size);
    for (size_t i = 0; i < MIN(5, result_vector->size); i++) {
        double gsl_val = gsl_vector_get(result_vector, i);
        double array_val = g_array_index(double_array, double, i);
        g_assert_cmpfloat_with_epsilon(gsl_val, array_val, 0.000001);
        printf("  Vector[%zu]: %f\n", i, gsl_val);
    }

    // Cleanup
    gsl_vector_free(result_vector);
    g_array_free(double_array, TRUE);
    for (guint i = 0; i < result_strings->len; i++) {
        g_free(g_array_index(result_strings, gchar *, i));
    }
    g_array_free(result_strings, TRUE);
    xmlXPathFreeObject(xpathObj);
    xmlXPathFreeContext(xpathCtx);
    xmlFreeDoc(doc);
}

int
main(int argc, char **argv)
{
    g_test_init(&argc, &argv, NULL);

    // Suppress expected error messages to avoid cluttering test output
    g_log_set_always_fatal(G_LOG_LEVEL_CRITICAL);

    g_test_add("/gslh/garraydouble_gsl_vector/valid", GSLHFixture, NULL, gslh_fixture_setup,
               test_garraydouble_gsl_vector_valid, gslh_fixture_teardown);

    g_test_add("/gslh/garraydouble_gsl_vector/empty", GSLHFixture, NULL, gslh_fixture_setup,
               test_garraydouble_gsl_vector_empty, gslh_fixture_teardown);

    g_test_add("/gslh/garraydouble_gsl_vector/single_element", GSLHFixture, NULL,
               gslh_fixture_setup, test_garraydouble_gsl_vector_single_element,
               gslh_fixture_teardown);

    g_test_add("/gslh/garraydouble_gsl_vector/large_array", GSLHFixture, NULL, gslh_fixture_setup,
               test_garraydouble_gsl_vector_large_array, gslh_fixture_teardown);

    g_test_add_func("/gslh/garraydouble_gsl_vector/null_array/subprocess",
                    test_garraydouble_gsl_vector_null_array_subprocess);
    g_test_add("/gslh/garraydouble_gsl_vector/null_array", GSLHFixture, NULL, gslh_fixture_setup,
               test_garraydouble_gsl_vector_null_array, gslh_fixture_teardown);

    g_test_add_func("/gslh/garraydouble_gsl_vector/null_out_vector/subprocess",
                    test_garraydouble_gsl_vector_null_out_vector_subprocess);
    g_test_add("/gslh/garraydouble_gsl_vector/null_out_vector", GSLHFixture, NULL,
               gslh_fixture_setup, test_garraydouble_gsl_vector_null_out_vector,
               gslh_fixture_teardown);

    g_test_add("/gslh/garraydouble_gsl_vector/special_values", GSLHFixture, NULL,
               gslh_fixture_setup, test_garraydouble_gsl_vector_special_values,
               gslh_fixture_teardown);

    g_test_add("/gslh/garraydouble_gsl_vector/from_updated_pic", GSLHFixture, NULL,
               gslh_fixture_setup, test_garraydouble_gsl_vector_from_updated_pic,
               gslh_fixture_teardown);

    return g_test_run();
}
