#include "../src/eval.h"
#include "../src/hdr.h"
#include "../src/risk_profile_tree.h"
#include <glib.h>
#include <libxml/parser.h>
#include <libxml/tree.h>

/* Minimal stub EvalContext to satisfy evaluate_src_inherent expectations */
static EvalContext *
make_eval_ctx(xmlDocPtr pic_doc)
{
    EvalContext *ctx = g_malloc0(sizeof(EvalContext));
    ctx->pic_doc = pic_doc; /* reuse same doc for simplicity */
    ctx->memo = g_hash_table_new_full(g_str_hash, g_str_equal, g_free, NULL);
    return ctx;
}

static void
free_eval_ctx(EvalContext *ctx)
{
    if (!ctx)
        return;
    if (ctx->memo)
        g_hash_table_destroy(ctx->memo);
    g_free(ctx);
}

/* Test: evaluate_src_inherent on fx test XML */
static void
test_evaluate_fx_xml(void)
{
    xmlDocPtr doc = xmlReadFile("data/source_inherent_out_fx_tests.xml", NULL, 0);
    g_assert_nonnull(doc);

    xmlDocPtr pic_doc = xmlReadFile("data/company_pic.xml", NULL, 0);
    g_assert_nonnull(pic_doc);

    EvalContext *ctx = make_eval_ctx(pic_doc);
    ILFResult res = { 0 };

    // ctx->pic_doc = pic_doc;

    ilf_status_t st = evaluate_src_inherent(doc, ctx, &res);
    g_assert_cmpint(st, ==, ILF_SUCCESS);
    g_assert_cmpint(res.status, ==, ILF_SUCCESS);

    free_eval_ctx(ctx);
    xmlFreeDoc(doc);
}

/* Test: evaluate_konsolidasi_inherent with updated_pic.xml containing results */
static void
test_evaluate_konsolidasi(void)
{
    // First, run evaluate_src_inherent to populate updated_pic.xml with results
    xmlDocPtr src_doc = xmlReadFile("data/source_inherent_out_fx_tests.xml", NULL, 0);
    g_assert_nonnull(src_doc);

    xmlDocPtr pic_doc = xmlReadFile("data/company_pic.xml", NULL, 0);
    g_assert_nonnull(pic_doc);

    EvalContext *ctx = make_eval_ctx(pic_doc);
    ILFResult src_res = { 0 };

    ilf_status_t st = evaluate_src_inherent(src_doc, ctx, &src_res);
    g_assert_cmpint(st, ==, ILF_SUCCESS);
    g_assert_cmpint(src_res.status, ==, ILF_SUCCESS);

    xmlFreeDoc(src_doc);

    // Now pic_doc has been updated with sourceInherentEvalResult nodes
    // Load updated_pic.xml that was written by evaluate_src_inherent
    xmlDocPtr updated_pic = xmlReadFile("updated_pic.xml", NULL, 0);
    g_assert_nonnull(updated_pic);

    // Update context to use the updated pic_doc
    if (ctx->pic_doc) {
        xmlFreeDoc(ctx->pic_doc);
    }
    ctx->pic_doc = updated_pic;

    // Load the source_inherent_out_fx_tests.xml again for konsolidasi evaluation
    xmlDocPtr konsolidasi_doc = xmlReadFile("data/source_inherent_out_fx_tests.xml", NULL, 0);
    g_assert_nonnull(konsolidasi_doc);

    ILFResult konsolidasi_res = { 0 };

    st = evaluate_konsolidasi_inherent(konsolidasi_doc, ctx, &konsolidasi_res);
    g_assert_cmpint(st, ==, ILF_SUCCESS);
    g_assert_cmpint(konsolidasi_res.status, ==, ILF_SUCCESS);

    // Verify that results hash table was created
    if (konsolidasi_res.data) {
        GHashTable *results_ht = (GHashTable *) konsolidasi_res.data;

        // Check that we have results for the expected sandi keys
        g_assert_cmpint(g_hash_table_size(results_ht), >, 0);

        // Verify specific results exist
        gpointer fx1_result = g_hash_table_lookup(results_ht, "FX000001");
        gpointer fx2_result = g_hash_table_lookup(results_ht, "FX000002");

        if (fx1_result) {
            gdouble *val = (gdouble *) fx1_result;
            printf("FX000001 konsolidasi result: %f\n", *val);
            // Sum of all results should be > 0 if there are results in updated_pic.xml
            g_assert_cmpfloat(*val, >, 0.0);
        }

        if (fx2_result) {
            gdouble *val = (gdouble *) fx2_result;
            printf("FX000002 konsolidasi result (mean): %f\n", *val);
            g_assert_cmpfloat(*val, >, 0.0);
        }

        // Don't free the hash table here - it's owned by konsolidasi_res.data
    }

    free_eval_ctx(ctx);
    xmlFreeDoc(konsolidasi_doc);
}

/* Test: evaluate_konsolidasi_inherent with empty pic_doc (no results yet) */
static void
test_evaluate_konsolidasi_empty(void)
{
    xmlDocPtr doc = xmlReadFile("data/source_inherent_out_fx_tests.xml", NULL, 0);
    g_assert_nonnull(doc);

    // Use original company_pic.xml without any sourceInherentEvalResult nodes
    xmlDocPtr pic_doc = xmlReadFile("data/company_pic.xml", NULL, 0);
    g_assert_nonnull(pic_doc);

    EvalContext *ctx = make_eval_ctx(pic_doc);
    ILFResult res = { 0 };

    ilf_status_t st = evaluate_konsolidasi_inherent(doc, ctx, &res);

    // Should still succeed even with no sourceInherentEvalResult nodes
    g_assert_cmpint(st, ==, ILF_SUCCESS);
    g_assert_cmpint(res.status, ==, ILF_SUCCESS);

    // Results should be 0.0 since there are no sourceInherentEvalResult nodes to aggregate
    if (res.data) {
        GHashTable *results_ht = (GHashTable *) res.data;

        gpointer fx1_result = g_hash_table_lookup(results_ht, "FX000001");
        if (fx1_result) {
            gdouble *val = (gdouble *) fx1_result;
            printf("FX000001 konsolidasi result (empty): %f\n", *val);
            // With no sourceInherentEvalResult nodes, consolidation functions should return 0.0
            g_assert_cmpfloat(*val, ==, 0.0);
        }
    }

    free_eval_ctx(ctx);
    xmlFreeDoc(doc);
}

/* Helper function to create EvalRiskProfileContext */
static EvalRiskProfileContext *
make_risk_profile_ctx(xmlDocPtr sandi_source_doc, xmlDocPtr risk_profile_doc)
{
    EvalRiskProfileContext *ctx = g_malloc0(sizeof(EvalRiskProfileContext));
    ctx->sandi_source_doc = sandi_source_doc;
    ctx->risk_profile_doc = risk_profile_doc;
    return ctx;
}

static void
free_risk_profile_ctx(EvalRiskProfileContext *ctx)
{
    if (!ctx)
        return;
    g_free(ctx);
}

/* Test: evaluate_risk_profile_tree basic functionality */
static void
test_evaluate_risk_profile_tree(void)
{
    // Load risk profile XML document
    xmlDocPtr risk_profile_doc
        = xmlReadFile("data/risk_profile_report_items.xml", NULL, XML_PARSE_NOBLANKS);
    g_assert_nonnull(risk_profile_doc);

    // Load sandi source document (can be updated_pic.xml or source_inherent_out_fx_tests.xml)
    xmlDocPtr sandi_source_doc
        = xmlReadFile("data/source_inherent_out_fx_tests.xml", NULL, XML_PARSE_NOBLANKS);
    g_assert_nonnull(sandi_source_doc);

    // Create context
    EvalRiskProfileContext *ctx = make_risk_profile_ctx(sandi_source_doc, risk_profile_doc);

    // Create result structure
    ILFResult res = { 0 };

    // Evaluate risk profile tree (doc parameter is not used in the implementation)
    ilf_status_t st = evaluate_risk_profile_tree(risk_profile_doc, ctx, &res);

    // Check that evaluation succeeded
    g_assert_cmpint(st, ==, ILF_SUCCESS);
    g_assert_cmpint(res.status, ==, ILF_SUCCESS);
    g_assert_null(res.error_message);

    // Check that tree was created
    g_assert_nonnull(res.data);
    GNode *tree = (GNode *) res.data;

    // Verify tree structure
    g_assert_nonnull(tree);
    g_assert_cmpuint(g_node_n_nodes(tree, G_TRAVERSE_ALL), >, 0);

    g_print("\n=== Risk Profile Tree Evaluation Test ===\n");
    g_print("Total nodes in tree: %u\n", g_node_n_nodes(tree, G_TRAVERSE_ALL));

    // Verify that evaluation results were added to XML
    // Find the RI0100100000 node and check for riskProfileEvaluationResult AND thresholdRating
    GNode *parent_node = find_node_by_profile_id(tree, "RI0100100000");
    g_assert_nonnull(parent_node);

    if (parent_node && parent_node->data) {
        RiskProfileData *data = (RiskProfileData *) parent_node->data;
        xmlNodePtr xml_node = data->xml_node;
        g_assert_nonnull(xml_node);

        // Look for riskProfileEvaluationResult in the XML node
        xmlNodePtr child = xml_node->children;
        gboolean found_result = FALSE;
        gboolean found_rating = FALSE;
        gdouble result_value = 0.0;
        gdouble rating_value = 0.0;

        while (child != NULL) {
            if (child->type == XML_ELEMENT_NODE
                && !xmlStrcmp(child->name, (const xmlChar *) "riskProfileEvaluationResult")) {
                found_result = TRUE;

                // Extract the value
                xmlNodePtr value_node = child->children;
                while (value_node != NULL) {
                    if (value_node->type == XML_ELEMENT_NODE
                        && !xmlStrcmp(value_node->name, (const xmlChar *) "value")) {
                        xmlChar *value_str = xmlNodeGetContent(value_node);
                        if (value_str) {
                            result_value = g_ascii_strtod((const gchar *) value_str, NULL);
                            xmlFree(value_str);
                        }
                        break;
                    }
                    value_node = value_node->next;
                }
            } else if (child->type == XML_ELEMENT_NODE
                       && !xmlStrcmp(child->name, (const xmlChar *) "thresholdRating")) {
                found_rating = TRUE;

                // Extract the rating value
                xmlNodePtr value_node = child->children;
                while (value_node != NULL) {
                    if (value_node->type == XML_ELEMENT_NODE
                        && !xmlStrcmp(value_node->name, (const xmlChar *) "value")) {
                        xmlChar *value_str = xmlNodeGetContent(value_node);
                        if (value_str) {
                            rating_value = g_ascii_strtod((const gchar *) value_str, NULL);
                            xmlFree(value_str);
                        }
                        break;
                    }
                    value_node = value_node->next;
                }
            }
            child = child->next;
        }

        g_assert_true(found_result);
        g_assert_true(found_rating);
        g_print("RI0100100000 evaluation result: %.3f\n", result_value);
        g_print("RI0100100000 threshold rating: %.1f\n", rating_value);

        // Expected: Sum of children (9.12 + 15.5 + 8.25 + 3.33 = 36.20)
        // Parent now aggregates children results instead of hardcoded value
        gdouble expected_sum = 9.12 + 15.5 + 8.25 + 3.33;
        g_assert_cmpfloat_with_epsilon(result_value, expected_sum, 0.01);

        // Expected rating: For score 36.20, ThresholdFunction should return 4.0 (36 < score <= 52)
        g_assert_cmpfloat_with_epsilon(rating_value, 4.0, 0.01);
    }

    // Verify child node evaluation (RI0100100100)
    GNode *child_node = find_node_by_profile_id(tree, "RI0100100100");
    g_assert_nonnull(child_node);

    if (child_node && child_node->data) {
        RiskProfileData *data = (RiskProfileData *) child_node->data;
        xmlNodePtr xml_node = data->xml_node;
        g_assert_nonnull(xml_node);

        xmlNodePtr child = xml_node->children;
        gboolean found_result = FALSE;
        gboolean found_rating = FALSE;
        gdouble result_value = 0.0;
        gdouble rating_value = 0.0;

        while (child != NULL) {
            if (child->type == XML_ELEMENT_NODE
                && !xmlStrcmp(child->name, (const xmlChar *) "riskProfileEvaluationResult")) {
                found_result = TRUE;

                xmlNodePtr value_node = child->children;
                while (value_node != NULL) {
                    if (value_node->type == XML_ELEMENT_NODE
                        && !xmlStrcmp(value_node->name, (const xmlChar *) "value")) {
                        xmlChar *value_str = xmlNodeGetContent(value_node);
                        if (value_str) {
                            result_value = g_ascii_strtod((const gchar *) value_str, NULL);
                            xmlFree(value_str);
                        }
                        break;
                    }
                    value_node = value_node->next;
                }
            } else if (child->type == XML_ELEMENT_NODE
                       && !xmlStrcmp(child->name, (const xmlChar *) "thresholdRating")) {
                found_rating = TRUE;

                xmlNodePtr value_node = child->children;
                while (value_node != NULL) {
                    if (value_node->type == XML_ELEMENT_NODE
                        && !xmlStrcmp(value_node->name, (const xmlChar *) "value")) {
                        xmlChar *value_str = xmlNodeGetContent(value_node);
                        if (value_str) {
                            rating_value = g_ascii_strtod((const gchar *) value_str, NULL);
                            xmlFree(value_str);
                        }
                        break;
                    }
                    value_node = value_node->next;
                }
            }
            child = child->next;
        }

        g_assert_true(found_result);
        g_assert_true(found_rating);
        g_print("RI0100100100 evaluation result: %.3f\n", result_value);
        g_print("RI0100100100 threshold rating: %.1f\n", rating_value);

        // Expected: 76.0 * 0.12 = 9.12
        g_assert_cmpfloat_with_epsilon(result_value, 9.12, 0.001);

        // Expected rating: For score 9.12, ThresholdFunction should return 5.0 (score <= 10.0)
        g_assert_cmpfloat_with_epsilon(rating_value, 5.0, 0.01);
    }

    // Clean up
    free_risk_profile_ctx(ctx);
    xmlFreeDoc(risk_profile_doc);
    xmlFreeDoc(sandi_source_doc);
}

/* Test: evaluate_risk_profile_tree with NULL documents */
static void
test_evaluate_risk_profile_tree_null_docs(void)
{
    // Test with NULL risk_profile_doc
    EvalRiskProfileContext *ctx1 = g_malloc0(sizeof(EvalRiskProfileContext));
    ctx1->sandi_source_doc = NULL;
    ctx1->risk_profile_doc = NULL;

    xmlDocPtr dummy_doc
        = xmlReadFile("data/risk_profile_report_items.xml", NULL, XML_PARSE_NOBLANKS);

    ILFResult res1 = { 0 };

    ilf_status_t st1 = evaluate_risk_profile_tree(dummy_doc, ctx1, &res1);

    // Should fail with NULL documents
    g_assert_cmpint(st1, ==, ILF_ERROR);
    g_assert_cmpint(res1.status, ==, ILF_ERROR);
    g_assert_nonnull(res1.error_message);

    g_print("Expected error message: %s\n", res1.error_message);

    // Clean up
    if (res1.error_message)
        free(res1.error_message);
    if (dummy_doc)
        xmlFreeDoc(dummy_doc);
    g_free(ctx1);
}

/* Test: evaluate_risk_profile_tree with NULL user_data */
static void
test_evaluate_risk_profile_tree_null_userdata(void)
{
    ILFResult res = { 0 };

    // This should cause g_error and fail
    // We need to trap the error
    if (g_test_subprocess()) {
        xmlDocPtr dummy_doc
            = xmlReadFile("data/risk_profile_report_items.xml", NULL, XML_PARSE_NOBLANKS);
        ilf_status_t st = evaluate_risk_profile_tree(dummy_doc, NULL, &res);
        if (dummy_doc)
            xmlFreeDoc(dummy_doc);
        (void) st; // Unused - g_error will exit before this
        return;
    }

    g_test_trap_subprocess(NULL, 0, 0);
    g_test_trap_assert_failed();
    g_test_trap_assert_stderr("*Invalid arguments to evaluate_risk_profile_tree*");
}

/* Test: evaluate_risk_profile_tree with NULL result */
static void
test_evaluate_risk_profile_tree_null_result(void)
{
    xmlDocPtr risk_profile_doc
        = xmlReadFile("data/risk_profile_report_items.xml", NULL, XML_PARSE_NOBLANKS);
    g_assert_nonnull(risk_profile_doc);

    xmlDocPtr sandi_source_doc
        = xmlReadFile("data/source_inherent_out_fx_tests.xml", NULL, XML_PARSE_NOBLANKS);
    g_assert_nonnull(sandi_source_doc);

    EvalRiskProfileContext *ctx = make_risk_profile_ctx(sandi_source_doc, risk_profile_doc);

    // This should cause g_error and fail
    if (g_test_subprocess()) {
        ilf_status_t st = evaluate_risk_profile_tree(risk_profile_doc, ctx, NULL);
        (void) st; // Unused
        return;
    }

    g_test_trap_subprocess(NULL, 0, 0);
    g_test_trap_assert_failed();
    g_test_trap_assert_stderr("*Invalid arguments to evaluate_risk_profile_tree*");

    // Clean up
    free_risk_profile_ctx(ctx);
    xmlFreeDoc(risk_profile_doc);
    xmlFreeDoc(sandi_source_doc);
}

/* Test: Parent node aggregates children results
 * Verifies that RI0100100000 (parent) correctly sums the evaluation
 * results from its children: RI0100100100, RI0100100200, RI0100100300, RI0100100400
 *
 * Expected child values:
 *   RI0100100100: 9.12
 *   RI0100100200: 15.5
 *   RI0100100300: 8.25
 *   RI0100100400: 3.33
 * Expected parent sum: 36.20
 */
static void
test_evaluate_risk_profile_tree_parent_aggregation(void)
{
    // Load risk profile XML document
    xmlDocPtr risk_profile_doc
        = xmlReadFile("data/risk_profile_report_items.xml", NULL, XML_PARSE_NOBLANKS);
    g_assert_nonnull(risk_profile_doc);

    // Load sandi source document
    xmlDocPtr sandi_source_doc
        = xmlReadFile("data/source_inherent_out_fx_tests.xml", NULL, XML_PARSE_NOBLANKS);
    g_assert_nonnull(sandi_source_doc);

    // Create context
    EvalRiskProfileContext *ctx = make_risk_profile_ctx(sandi_source_doc, risk_profile_doc);

    // Create result structure
    ILFResult res = { 0 };

    // Evaluate risk profile tree
    ilf_status_t st = evaluate_risk_profile_tree(risk_profile_doc, ctx, &res);

    // Check that evaluation succeeded
    g_assert_cmpint(st, ==, ILF_SUCCESS);
    g_assert_cmpint(res.status, ==, ILF_SUCCESS);
    g_assert_null(res.error_message);

    // Get the tree
    g_assert_nonnull(res.data);
    GNode *tree = (GNode *) res.data;

    g_print("\n=== Parent Aggregation Test ===\n");

    // Verify child nodes have their individual scores
    const char *child_ids[] = { "RI0100100100", "RI0100100200", "RI0100100300", "RI0100100400" };
    gdouble expected_children[] = { 9.12, 15.5, 8.25, 3.33 };

    for (int i = 0; i < 4; i++) {
        GNode *child_node = find_node_by_profile_id(tree, child_ids[i]);
        g_assert_nonnull(child_node);

        if (child_node && child_node->data) {
            RiskProfileData *data = (RiskProfileData *) child_node->data;
            xmlNodePtr xml_node = data->xml_node;

            // Find riskProfileEvaluationResult
            xmlNodePtr child = xml_node->children;
            gboolean found_result = FALSE;
            gdouble result_value = 0.0;

            while (child != NULL) {
                if (child->type == XML_ELEMENT_NODE
                    && !xmlStrcmp(child->name, (const xmlChar *) "riskProfileEvaluationResult")) {
                    found_result = TRUE;

                    xmlNodePtr value_node = child->children;
                    while (value_node != NULL) {
                        if (value_node->type == XML_ELEMENT_NODE
                            && !xmlStrcmp(value_node->name, (const xmlChar *) "value")) {
                            xmlChar *value_str = xmlNodeGetContent(value_node);
                            if (value_str) {
                                result_value = g_ascii_strtod((const gchar *) value_str, NULL);
                                xmlFree(value_str);
                            }
                            break;
                        }
                        value_node = value_node->next;
                    }
                    break;
                }
                child = child->next;
            }

            g_assert_true(found_result);
            g_print("Child %s evaluation result: %.2f\n", child_ids[i], result_value);
            g_assert_cmpfloat_with_epsilon(result_value, expected_children[i], 0.01);
        }
    }

    // Verify parent node (RI0100100000) has sum of children
    GNode *parent_node = find_node_by_profile_id(tree, "RI0100100000");
    g_assert_nonnull(parent_node);

    if (parent_node && parent_node->data) {
        RiskProfileData *data = (RiskProfileData *) parent_node->data;
        xmlNodePtr xml_node = data->xml_node;

        // Find riskProfileEvaluationResult
        xmlNodePtr child = xml_node->children;
        gboolean found_result = FALSE;
        gdouble result_value = 0.0;

        while (child != NULL) {
            if (child->type == XML_ELEMENT_NODE
                && !xmlStrcmp(child->name, (const xmlChar *) "riskProfileEvaluationResult")) {
                found_result = TRUE;

                xmlNodePtr value_node = child->children;
                while (value_node != NULL) {
                    if (value_node->type == XML_ELEMENT_NODE
                        && !xmlStrcmp(value_node->name, (const xmlChar *) "value")) {
                        xmlChar *value_str = xmlNodeGetContent(value_node);
                        if (value_str) {
                            result_value = g_ascii_strtod((const gchar *) value_str, NULL);
                            xmlFree(value_str);
                        }
                        break;
                    }
                    value_node = value_node->next;
                }
                break;
            }
            child = child->next;
        }

        g_assert_true(found_result);
        g_print("Parent RI0100100000 aggregated result: %.2f\n", result_value);

        // Expected: 9.12 + 15.5 + 8.25 + 3.33 = 36.20
        gdouble expected_sum = 9.12 + 15.5 + 8.25 + 3.33;
        g_print("Expected sum: %.2f\n", expected_sum);
        g_assert_cmpfloat_with_epsilon(result_value, expected_sum, 0.01);
    }

    // Clean up
    free_risk_profile_ctx(ctx);
    xmlFreeDoc(risk_profile_doc);
    xmlFreeDoc(sandi_source_doc);
}

/* Test: Apply rating-to-score mapping and calculate weighted scores
 * Verifies the complete workflow:
 * 1. Evaluate risk profile tree (get thresholdRating)
 * 2. Apply rating-to-score mapping
 * 3. Calculate finalScore and scoreXweight
 * 4. Save results to output XML
 */
static void
test_apply_rating_to_score_mapping(void)
{
    // Load risk profile XML document
    xmlDocPtr risk_profile_doc
        = xmlReadFile("data/risk_profile_report_items.xml", NULL, XML_PARSE_NOBLANKS);
    g_assert_nonnull(risk_profile_doc);

    // Load sandi source document
    xmlDocPtr sandi_source_doc
        = xmlReadFile("data/source_inherent_out_fx_tests.xml", NULL, XML_PARSE_NOBLANKS);
    g_assert_nonnull(sandi_source_doc);

    // Load rating to score mapping
    xmlDocPtr rating_to_score_doc
        = xmlReadFile("data/rating_to_score.xml", NULL, XML_PARSE_NOBLANKS);
    g_assert_nonnull(rating_to_score_doc);

    // Create context and evaluate tree
    EvalRiskProfileContext *ctx = make_risk_profile_ctx(sandi_source_doc, risk_profile_doc);
    ILFResult res = { 0 };
    ilf_status_t st = evaluate_risk_profile_tree(risk_profile_doc, ctx, &res);

    g_assert_cmpint(st, ==, ILF_SUCCESS);
    g_assert_cmpint(res.status, ==, ILF_SUCCESS);

    g_print("\n=== Rating to Score Mapping Test ===\n");

    // Apply rating-to-score mapping
    st = apply_rating_to_score_mapping(risk_profile_doc, rating_to_score_doc);
    g_assert_cmpint(st, ==, ILF_SUCCESS);

    // Verify RI0100100000: rating=4.0 → score=44, weight=0.28 → scoreXweight=12.32
    GNode *tree = (GNode *) res.data;
    GNode *parent_node = find_node_by_profile_id(tree, "RI0100100000");
    g_assert_nonnull(parent_node);

    if (parent_node && parent_node->data) {
        RiskProfileData *data = (RiskProfileData *) parent_node->data;
        xmlNodePtr xml_node = data->xml_node;

        // Find finalScore
        xmlNodePtr child = xml_node->children;
        gboolean found_final_score = FALSE;
        gboolean found_score_x_weight = FALSE;
        gdouble final_score_value = 0.0;
        gdouble score_x_weight_value = 0.0;

        while (child != NULL) {
            if (child->type == XML_ELEMENT_NODE
                && !xmlStrcmp(child->name, (const xmlChar *) "finalScore")) {
                found_final_score = TRUE;
                xmlNodePtr valueNode = child->children;
                while (valueNode != NULL) {
                    if (valueNode->type == XML_ELEMENT_NODE
                        && !xmlStrcmp(valueNode->name, (const xmlChar *) "value")) {
                        xmlChar *content = xmlNodeGetContent(valueNode);
                        if (content) {
                            final_score_value = g_ascii_strtod((const char *) content, NULL);
                            xmlFree(content);
                        }
                        break;
                    }
                    valueNode = valueNode->next;
                }
            } else if (child->type == XML_ELEMENT_NODE
                       && !xmlStrcmp(child->name, (const xmlChar *) "scoreXweight")) {
                found_score_x_weight = TRUE;
                xmlNodePtr valueNode = child->children;
                while (valueNode != NULL) {
                    if (valueNode->type == XML_ELEMENT_NODE
                        && !xmlStrcmp(valueNode->name, (const xmlChar *) "value")) {
                        xmlChar *content = xmlNodeGetContent(valueNode);
                        if (content) {
                            score_x_weight_value = g_ascii_strtod((const char *) content, NULL);
                            xmlFree(content);
                        }
                        break;
                    }
                    valueNode = valueNode->next;
                }
            }
            child = child->next;
        }

        g_assert_true(found_final_score);
        g_assert_true(found_score_x_weight);

        g_print("RI0100100000 final score: %.2f\n", final_score_value);
        g_print("RI0100100000 score x weight: %.6f\n", score_x_weight_value);

        // Rating 4.0 → Score 44
        g_assert_cmpfloat_with_epsilon(final_score_value, 44.0, 0.01);
        // Score 44 * Weight 0.28 = 12.32
        g_assert_cmpfloat_with_epsilon(score_x_weight_value, 12.32, 0.01);
    }

    // Verify RI0100100100: rating=5.0 → score=28, weight=0.12 → scoreXweight=3.36
    GNode *child_node = find_node_by_profile_id(tree, "RI0100100100");
    g_assert_nonnull(child_node);

    if (child_node && child_node->data) {
        RiskProfileData *data = (RiskProfileData *) child_node->data;
        xmlNodePtr xml_node = data->xml_node;

        xmlNodePtr child = xml_node->children;
        gdouble final_score_value = 0.0;
        gdouble score_x_weight_value = 0.0;

        while (child != NULL) {
            if (child->type == XML_ELEMENT_NODE
                && !xmlStrcmp(child->name, (const xmlChar *) "finalScore")) {
                xmlNodePtr valueNode = child->children;
                while (valueNode != NULL) {
                    if (valueNode->type == XML_ELEMENT_NODE
                        && !xmlStrcmp(valueNode->name, (const xmlChar *) "value")) {
                        xmlChar *content = xmlNodeGetContent(valueNode);
                        if (content) {
                            final_score_value = g_ascii_strtod((const char *) content, NULL);
                            xmlFree(content);
                        }
                        break;
                    }
                    valueNode = valueNode->next;
                }
            } else if (child->type == XML_ELEMENT_NODE
                       && !xmlStrcmp(child->name, (const xmlChar *) "scoreXweight")) {
                xmlNodePtr valueNode = child->children;
                while (valueNode != NULL) {
                    if (valueNode->type == XML_ELEMENT_NODE
                        && !xmlStrcmp(valueNode->name, (const xmlChar *) "value")) {
                        xmlChar *content = xmlNodeGetContent(valueNode);
                        if (content) {
                            score_x_weight_value = g_ascii_strtod((const char *) content, NULL);
                            xmlFree(content);
                        }
                        break;
                    }
                    valueNode = valueNode->next;
                }
            }
            child = child->next;
        }

        g_print("RI0100100100 final score: %.2f\n", final_score_value);
        g_print("RI0100100100 score x weight: %.6f\n", score_x_weight_value);

        // Rating 5.0 → Score 28
        g_assert_cmpfloat_with_epsilon(final_score_value, 28.0, 0.01);
        // Score 28 * Weight 0.12 = 3.36
        g_assert_cmpfloat_with_epsilon(score_x_weight_value, 3.36, 0.01);
    }

    // Save the result to output file
    st = save_risk_profile_result(risk_profile_doc, "risk_profile_output.xml");
    g_assert_cmpint(st, ==, ILF_SUCCESS);

    // Clean up
    free_risk_profile_ctx(ctx);
    xmlFreeDoc(risk_profile_doc);
    xmlFreeDoc(sandi_source_doc);
    xmlFreeDoc(rating_to_score_doc);
}

int
main(int argc, char **argv)
{
    g_test_init(&argc, &argv, NULL);
    g_test_add_func("/eval/evaluate_fx_xml", test_evaluate_fx_xml);
    g_test_add_func("/eval/evaluate_konsolidasi", test_evaluate_konsolidasi);
    g_test_add_func("/eval/evaluate_konsolidasi_empty", test_evaluate_konsolidasi_empty);
    g_test_add_func("/eval/evaluate_risk_profile_tree", test_evaluate_risk_profile_tree);
    g_test_add_func("/eval/evaluate_risk_profile_tree_null_docs",
                    test_evaluate_risk_profile_tree_null_docs);
    g_test_add_func("/eval/evaluate_risk_profile_tree_null_userdata",
                    test_evaluate_risk_profile_tree_null_userdata);
    g_test_add_func("/eval/evaluate_risk_profile_tree_null_result",
                    test_evaluate_risk_profile_tree_null_result);
    g_test_add_func("/eval/evaluate_risk_profile_tree_parent_aggregation",
                    test_evaluate_risk_profile_tree_parent_aggregation);
    g_test_add_func("/eval/apply_rating_to_score_mapping", test_apply_rating_to_score_mapping);
    return g_test_run();
}