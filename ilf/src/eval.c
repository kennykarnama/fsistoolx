#include "eval.h"
#include "glibh.h"
#include "risk_profile_tree.h"
#include "tcch.h"

/**
 * Helper function to evaluate risk profile tree nodes
 * This evaluates both Logic_Risk_Profile_Fx and ThresholdFunction:
 * 1. First evaluate Logic_Risk_Profile_Fx to get the score
 * 2. Then evaluate ThresholdFunction passing the score as user_data
 * 3. Store both results in XML
 */
gboolean
_fx_risk_profile(GNode *node, gpointer data)
{
    EvalRiskProfileContext *ctx = (EvalRiskProfileContext *) data;

    if (!ctx->sandi_source_doc || !ctx->risk_profile_doc) {
        g_error("Invalid EvalRiskProfileContext: missing XML documents");
        return FALSE;
    }

    // Skip nodes without data (e.g., virtual root node)
    RiskProfileData *rp_data = (RiskProfileData *) node->data;
    if (!rp_data) {
        return FALSE; // Continue traversal, skip this node
    }

    // Here we are evaluating the xml of risk profile containing element
    // <Logic_Risk_Profile_Fx></Logic_Risk_Profile_Fx>
    // like the usual what we do in source inherent evaluation
    // we will compile the code and execute it to get the result

    xmlDocPtr doc = ctx->risk_profile_doc;

    xmlNodePtr cur = rp_data->xml_node;
    cur = cur->xmlChildrenNode;

    // Step 1: Evaluate Logic_Risk_Profile_Fx to get the score
    gdouble score_value = 0.0;
    gboolean has_score = FALSE;

    xmlNodePtr temp_cur = cur;
    while (temp_cur != NULL) {
        if ((!xmlStrcmp(temp_cur->name, (const xmlChar *) "Logic_Risk_Profile_Fx"))) {
            xmlChar *logic_fx = xmlNodeListGetString(doc, temp_cur->xmlChildrenNode, 1);
            if (logic_fx) {
                gchar *logic_fx_str = g_strdup((const char *) logic_fx);
                xmlFree(logic_fx);

                TCCState *tcc_state = tcc_new();
                if (!tcc_state) {
                    g_error("Failed to create TCC state for risk profile fx");
                    g_free(logic_fx_str);
                    return FALSE;
                }

                ILFResult *tcch_eval_result = g_malloc0(sizeof(ILFResult));

                ilf_status_t status = tcch_compile_code(logic_fx_str, tcc_state, tcch_eval_result);
                if (status != ILF_SUCCESS) {
                    g_error("TCC compilation failed for risk profile fx");
                    tcc_delete(tcc_state);
                    g_free(tcch_eval_result);
                    g_free(logic_fx_str);
                    return FALSE;
                }

                // Execute the compiled function to get the score
                // Pass risk_profile_doc so parent nodes can query child results
                gdouble (*f)(xmlDocPtr, xmlNodePtr, gpointer, gpointer) = tcch_eval_result->data;
                score_value = f(ctx->risk_profile_doc, temp_cur, NULL, NULL);
                has_score = TRUE;

                printf("Evaluated Risk Profile Fx for %s: Result: %f\n", rp_data->profile_id,
                       score_value);

                // Store the score result as a child of the RiskProfile node
                // <riskProfileEvaluationResult><value>21.728</value></riskProfileEvaluationResult>
                xmlNodePtr result_node = xmlNewChild(
                    rp_data->xml_node, NULL, (const xmlChar *) "riskProfileEvaluationResult", NULL);
                if (result_node) {
                    gchar result_str[64];
                    snprintf(result_str, sizeof(result_str), "%.6f", score_value);
                    xmlNewChild(result_node, NULL, (const xmlChar *) "value",
                                (const xmlChar *) result_str);
                }

                // Clean up
                tcc_delete(tcc_state);
                g_free(tcch_eval_result);
                g_free(logic_fx_str);

                break; // Only process first Logic_Risk_Profile_Fx
            }
        }
        temp_cur = temp_cur->next;
    }

    // Step 2: Evaluate ThresholdFunction using the score from Logic_Risk_Profile_Fx
    if (has_score) {
        temp_cur = cur;
        while (temp_cur != NULL) {
            if ((!xmlStrcmp(temp_cur->name, (const xmlChar *) "ThresholdFunction"))) {
                xmlChar *threshold_fx = xmlNodeListGetString(doc, temp_cur->xmlChildrenNode, 1);
                if (threshold_fx) {
                    gchar *threshold_fx_str = g_strdup((const char *) threshold_fx);
                    xmlFree(threshold_fx);

                    TCCState *tcc_state_threshold = tcc_new();
                    if (!tcc_state_threshold) {
                        g_error("Failed to create TCC state for threshold function");
                        g_free(threshold_fx_str);
                        return FALSE;
                    }

                    ILFResult *tcch_threshold_result = g_malloc0(sizeof(ILFResult));

                    ilf_status_t status = tcch_compile_code(threshold_fx_str, tcc_state_threshold,
                                                            tcch_threshold_result);
                    if (status != ILF_SUCCESS) {
                        g_error("TCC compilation failed for threshold function");
                        tcc_delete(tcc_state_threshold);
                        g_free(tcch_threshold_result);
                        g_free(threshold_fx_str);
                        return FALSE;
                    }

                    // Execute the threshold function, passing the score as user_data
                    // Pass risk_profile_doc for consistency
                    gdouble (*threshold_f)(xmlDocPtr, xmlNodePtr, gpointer, gpointer)
                        = tcch_threshold_result->data;
                    gdouble rating_value = threshold_f(ctx->risk_profile_doc, temp_cur,
                                                       (gpointer) &score_value, NULL);

                    printf("Evaluated Threshold Function for %s: Score=%f, Rating=%f\n",
                           rp_data->profile_id, score_value, rating_value);

                    // Store the rating result as a child of the RiskProfile node
                    // <thresholdRating><value>2.0</value></thresholdRating>
                    xmlNodePtr rating_node = xmlNewChild(rp_data->xml_node, NULL,
                                                         (const xmlChar *) "thresholdRating", NULL);
                    if (rating_node) {
                        gchar rating_str[64];
                        snprintf(rating_str, sizeof(rating_str), "%.1f", rating_value);
                        xmlNewChild(rating_node, NULL, (const xmlChar *) "value",
                                    (const xmlChar *) rating_str);
                    }

                    // Clean up
                    tcc_delete(tcc_state_threshold);
                    g_free(tcch_threshold_result);
                    g_free(threshold_fx_str);

                    break; // Only process first ThresholdFunction
                }
            }
            temp_cur = temp_cur->next;
        }
    }

    return FALSE; // Continue traversal
}

ilf_status_t
evaluate_src_inherent(xmlDocPtr doc, gpointer user_data, gpointer result)
{
    if (!doc || !result) {
        g_error("Invalid arguments to evaluate_src_inherent");
        return ILF_ERROR;
    }

    EvalContext *ctx = (EvalContext *) user_data;

    ILFResult *eval_result = (ILFResult *) result;

    if (!ctx->pic_doc) {
        eval_result->status = ILF_ERROR;
        eval_result->error_message = g_strdup("User data XML document is NULL");
        eval_result->data = NULL;

        return ILF_ERROR;
    }

    if (!ctx->memo) {
        eval_result->status = ILF_ERROR;
        eval_result->error_message = g_strdup("User data memo hash table is NULL");
        eval_result->data = NULL;

        return ILF_ERROR;
    }

    xmlNodePtr cur;

    g_print("begin evaluating src inherent");

    cur = xmlDocGetRootElement(doc);

    if (xmlStrcmp(cur->name, (const xmlChar *) "sourceInherentRevampReport")) {
        eval_result->status = ILF_ERROR;
        eval_result->error_message = g_strdup("Document of the wrong type");
        eval_result->data = NULL;

        return ILF_ERROR;
    }

     if (xmlStrcmp(cur->name, (const xmlChar *) "worksheet_inherent")) {
        eval_result->status = ILF_ERROR;
        eval_result->error_message = g_strdup("Document of the wrong type missing worksheet inherent");
        eval_result->data = NULL;

        return ILF_ERROR;
    }
    

    cur = cur->xmlChildrenNode;

    GHashTable *results_ht = g_hash_table_new_full(g_str_hash, g_str_equal, g_free, g_free);

    while (cur != NULL) {
        // Store current record key for later XPath operations
        gchar *current_sandi_key = NULL;

        xmlNodePtr node = cur->xmlChildrenNode;
        gchar *logic_ljk = NULL;
        gchar *input_type = NULL;
        gchar *sandi_revamp = NULL;
        gchar *pic = NULL;

        while (node != NULL) {
            if ((!xmlStrcmp(node->name, (const xmlChar *) "pic"))) {
                xmlChar *pic_x = xmlNodeListGetString(doc, node->xmlChildrenNode, 1);
                if (pic_x) {
                    printf("Found pic: %s\n", (const char *) pic_x);
                    pic = g_strdup((const char *) pic_x);
                    xmlFree(pic_x);
                }
            }
            // if we encounter sandiRevamp, we need to store into hashtable
            // this will be used later to determine which PIC value we need to update
            if ((!xmlStrcmp(node->name, (const xmlChar *) "sandiRevamp"))) {
                xmlChar *sandi_revamp_x = xmlNodeListGetString(doc, node->xmlChildrenNode, 1);
                if (sandi_revamp_x) {
                    sandi_revamp = g_strdup((const char *) sandi_revamp_x);
                    current_sandi_key = g_strdup(sandi_revamp);

                    printf("Found sandiRevamp: %s\n", sandi_revamp);

                    // Initialize with NULL value (will be updated after evaluation)
                    g_hash_table_insert(results_ht, g_strdup(sandi_revamp), NULL);

                    xmlFree(sandi_revamp_x);
                }
            }

            // extract logicLjk and inputType
            if ((!xmlStrcmp(node->name, (const xmlChar *) "logicLjk"))) {
                xmlChar *ljk_script = xmlNodeListGetString(doc, node->xmlChildrenNode, 1);
                if (ljk_script) {
                    logic_ljk = g_strdup((const char *) ljk_script);
                    xmlFree(ljk_script);
                }
            }

            if (!(xmlStrcmp(node->name, (const xmlChar *) "inputType"))) {
                xmlChar *input_type_x = xmlNodeListGetString(doc, node->xmlChildrenNode, 1);
                if (input_type_x) {
                    input_type = g_strdup((const char *) input_type_x);
                    xmlFree(input_type_x);
                }
            }

            node = node->next;
        }

        // Now evaluate logicLjk if we have all required data
        if (logic_ljk && strlen(logic_ljk) > 0 && sandi_revamp && strlen(sandi_revamp) > 0) {
            printf("Evaluating logicLjk: %s with inputType: %s\n", logic_ljk,
                   input_type ? input_type : "NULL");

            TCCState *tcc_state = tcc_new();
            if (!tcc_state) {
                eval_result->status = ILF_ERROR;
                eval_result->error_message = g_strdup("Failed to create TCC state");
                eval_result->data = NULL;
                if (logic_ljk)
                    g_free(logic_ljk);
                if (input_type)
                    g_free(input_type);
                if (sandi_revamp)
                    g_free(sandi_revamp);
                if (pic)
                    g_free(pic);
                if (current_sandi_key)
                    g_free(current_sandi_key);
                return ILF_ERROR;
            }

            ILFResult *tcch_eval_result = g_malloc0(sizeof(ILFResult));

            ilf_status_t status = tcch_compile_code(logic_ljk, tcc_state, tcch_eval_result);
            if (status != ILF_SUCCESS) {
                // eval_result->status = ILF_ERROR;
                // eval_result->error_message = g_strdup("TCC compilation failed");
                // eval_result->data = NULL;
                // tcc_delete(tcc_state);
                // g_free(tcch_eval_result);
                // if (logic_ljk)
                //     g_free(logic_ljk);
                // if (input_type)
                //     g_free(input_type);
                // if (sandi_revamp)
                //     g_free(sandi_revamp);
                // if (pic)
                //     g_free(pic);
                // if (current_sandi_key)
                //     g_free(current_sandi_key);
                // return ILF_ERROR;
                cur = cur->next;
                continue;
            }

            if (!tcch_eval_result->data) {
                eval_result->status = ILF_ERROR;
                eval_result->error_message = g_strdup("Compiled function pointer is NULL");
                eval_result->data = NULL;
                tcc_delete(tcc_state);
                g_free(tcch_eval_result);
                if (logic_ljk)
                    g_free(logic_ljk);
                if (input_type)
                    g_free(input_type);
                if (sandi_revamp)
                    g_free(sandi_revamp);
                if (pic)
                    g_free(pic);
                if (current_sandi_key)
                    g_free(current_sandi_key);
                return ILF_ERROR;
            }

            gdouble (*f)(xmlDocPtr doc, xmlNodePtr cur, gpointer user_data, gpointer result)
                = tcch_eval_result->data;

            EvalContext *eval_ctx = g_malloc0(sizeof(EvalContext));
            eval_ctx->pic_doc = ctx->pic_doc;
            eval_ctx->memo = ctx->memo;
            gdouble eval_result_val = f(doc, cur, eval_ctx, NULL);

            printf("Evaluation sandi: %s result: %f\n", sandi_revamp, eval_result_val);

            // allocate a pointer to gdouble to store in hash table
            gdouble *valp = g_new(gdouble, 1);
            *valp = eval_result_val;

            // Replace the NULL value with actual result
            g_hash_table_replace(results_ht, g_strdup(sandi_revamp), valp);

            g_free(eval_ctx);
            tcc_delete(tcc_state);
            g_free(tcch_eval_result);
        }

        if (logic_ljk)
            g_free(logic_ljk);
        if (input_type)
            g_free(input_type);

        // Print the hash table contents for debugging

        // Process PIC xpath and update pic_doc if we have valid data
        if (pic && current_sandi_key) {
            const xmlChar *pic_q = (const xmlChar *) "/prmtr_company/DATA_RECORD[type=\"%s\"]";
            gchar *pic_xpath = NULL;

            if (g_strcmp0(pic, "All LJK") == 0) {
                pic_xpath = g_strdup_printf("/prmtr_company/DATA_RECORD[type=*]");
            } else if (g_strcmp0(pic, "Bank") == 0) {
                pic_xpath = g_strdup_printf((const char *) pic_q, "BANK");
            }else {
                pic_xpath = g_strdup_printf("/prmtr_company/DATA_RECORD[type=*]"); // TODO: handle based on PIC type
            }

            if (!pic_xpath) {
                g_error("Unknown PIC value: %s\n", pic);
            }

            if (pic_xpath) {
                printf("PIC XPath: %s\n", pic_xpath);

                xmlXPathContextPtr xpathCtx;
                xmlXPathObjectPtr xpathObj;

                xmlChar *xmlbuff;
                int buffersize;
                xmlDocDumpFormatMemory(cur->doc, &xmlbuff, &buffersize, 1);
                printf("dumpy %s", (char *) xmlbuff);
                xmlFree(xmlbuff);

                xpathCtx = xmlXPathNewContext(ctx->pic_doc);
                if (!xpathCtx) {
                    eval_result->status = ILF_ERROR;
                    eval_result->error_message = g_strdup("Failed to create XPath context");
                    eval_result->data = NULL;
                    if (pic)
                        g_free(pic);
                    if (sandi_revamp)
                        g_free(sandi_revamp);
                    if (current_sandi_key)
                        g_free(current_sandi_key);
                    g_free(pic_xpath);
                    return ILF_ERROR;
                }

                xpathObj = xmlXPathEvalExpression((const xmlChar *) pic_xpath, xpathCtx);
                if (!xpathObj) {
                    eval_result->status = ILF_ERROR;
                    eval_result->error_message = g_strdup("Failed to evaluate PIC XPath expression");
                    eval_result->data = NULL;
                    xmlXPathFreeContext(xpathCtx);
                    if (pic)
                        g_free(pic);
                    if (sandi_revamp)
                        g_free(sandi_revamp);
                    if (current_sandi_key)
                        g_free(current_sandi_key);
                    g_free(pic_xpath);
                    return ILF_ERROR;
                }

                // xPathObj contains xmlNodeSetPtr of matched nodes
                // we iterate through them and add new elements
                xmlNodeSetPtr nodes = xpathObj->nodesetval;
                if (nodes) {
                    printf("gokil\n");
                    for (int i = 0; i < nodes->nodeNr; i++) {
                        xmlNodePtr pic_node = nodes->nodeTab[i];

                        printf("Matched PIC node: %s\n", pic_node->name);

                        // Look up the result using current_sandi_key
                        gdouble *result_ptr
                            = (gdouble *) g_hash_table_lookup(results_ht, current_sandi_key);
                        if (result_ptr) {
                            // add new element containing sandiRevamp and evaluation result
                            xmlNodePtr new_elem = xmlNewChild(
                                pic_node, NULL, (const xmlChar *) "sourceInherentEvalResult", NULL);
                            xmlNewChild(new_elem, NULL, (const xmlChar *) "sandiRevamp",
                                        (const xmlChar *) current_sandi_key);

                            gchar *result_str = g_strdup_printf("%f", *result_ptr);
                            xmlNewChild(new_elem, NULL, (const xmlChar *) "result",
                                        (const xmlChar *) result_str);
                            g_free(result_str);
                        }
                    }
                }

                xmlXPathFreeObject(xpathObj);
                xmlXPathFreeContext(xpathCtx);
                g_free(pic_xpath);
            }
        }

        // Clean up per-record allocations
        if (sandi_revamp)
            g_free(sandi_revamp);
        if (pic)
            g_free(pic);
        if (current_sandi_key)
            g_free(current_sandi_key);

        // g_hash_table_foreach(results_ht, print_hash_tables, NULL);

        cur = cur->next;
    }

    // write back updated pic_doc to file
    eval_result->status = ILF_SUCCESS;
    eval_result->error_message = NULL;

    // Write the updated pic_doc back to the file
    int written = xmlSaveFile("updated_pic.xml", ctx->pic_doc);

    if (written == -1) {
        eval_result->status = ILF_ERROR;
        eval_result->error_message = g_strdup("Failed to write updated PIC XML document to file");
        eval_result->data = NULL;

        return ILF_ERROR;
    }

    return ILF_SUCCESS;
}

/**
 * Evaluates konsolidasi inherent logic from the provided XML document.
 * you need to run evaluate_src_inherent first to populate memo table and update pic_doc.
 * @param doc The XML document to evaluate.
 * @param user_data User data to be passed to the evaluation function.
 * @param result A pointer to store the evaluation result.
 * @return ILF_SUCCESS on success, ILF_ERROR on failure.
 */
ilf_status_t
evaluate_konsolidasi_inherent(xmlDocPtr doc, gpointer user_data, gpointer result)
{
    if (!doc || !result) {
        g_error("Invalid arguments to evaluate_konsolidasi_inherent");
        return ILF_ERROR;
    }

    EvalContext *ctx = (EvalContext *) user_data;

    ILFResult *eval_result = (ILFResult *) result;

    if (!ctx->pic_doc) {
        eval_result->status = ILF_ERROR;
        eval_result->error_message = g_strdup("User data XML document is NULL");
        eval_result->data = NULL;

        return ILF_ERROR;
    }

    if (!ctx->memo) {
        eval_result->status = ILF_ERROR;
        eval_result->error_message = g_strdup("User data memo hash table is NULL");
        eval_result->data = NULL;

        return ILF_ERROR;
    }

    xmlNodePtr cur;

    cur = xmlDocGetRootElement(doc);

    if (xmlStrcmp(cur->name, (const xmlChar *) "sourceInherentRevampReport")) {
        eval_result->status = ILF_ERROR;
        eval_result->error_message = g_strdup("Document of the wrong type");
        eval_result->data = NULL;

        return ILF_ERROR;
    }

    cur = cur->xmlChildrenNode;

    GHashTable *results_ht = g_hash_table_new_full(g_str_hash, g_str_equal, g_free, g_free);

    while (cur != NULL) {
        // Store current record key for later XPath operations
        gchar *current_sandi_key = NULL;

        xmlNodePtr node = cur->xmlChildrenNode;
        gchar *logic_konsolidasi = NULL;
        gchar *sandi_revamp = NULL;
        gchar *pic = NULL;

        while (node != NULL) {
            // if we encounter sandiRevamp, we need to store into hashtable
            // this will be used later to determine which PIC value we need to update
            if ((!xmlStrcmp(node->name, (const xmlChar *) "sandiRevamp"))) {
                xmlChar *sandi_revamp_x = xmlNodeListGetString(doc, node->xmlChildrenNode, 1);
                if (sandi_revamp_x) {
                    sandi_revamp = g_strdup((const char *) sandi_revamp_x);
                    current_sandi_key = g_strdup(sandi_revamp);

                    printf("Found sandiRevamp: %s\n", sandi_revamp);

                    // Initialize with NULL value (will be updated after evaluation)
                    g_hash_table_insert(results_ht, g_strdup(sandi_revamp), NULL);

                    xmlFree(sandi_revamp_x);
                }
            }

            // extract logicKonsolidasi and inputType
            if ((!xmlStrcmp(node->name, (const xmlChar *) "logicKonsolidasi"))) {
                xmlChar *lk_script = xmlNodeListGetString(doc, node->xmlChildrenNode, 1);
                if (lk_script) {
                    logic_konsolidasi = g_strdup((const char *) lk_script);
                    xmlFree(lk_script);
                }
            }

            // extract pic element
            if ((!xmlStrcmp(node->name, (const xmlChar *) "pic"))) {
                xmlChar *pic_x = xmlNodeListGetString(doc, node->xmlChildrenNode, 1);
                if (pic_x) {
                    pic = g_strdup((const char *) pic_x);
                    xmlFree(pic_x);
                }
            }

            node = node->next;
        }

        // Now evaluate logicKonsolidasi if we have all required data
        if (logic_konsolidasi && strlen(logic_konsolidasi) > 0 && sandi_revamp
            && strlen(sandi_revamp) > 0) {
            printf("Evaluating logicKonsolidasi: %s\n", logic_konsolidasi);

            TCCState *tcc_state = tcc_new();
            if (!tcc_state) {
                eval_result->status = ILF_ERROR;
                eval_result->error_message = g_strdup("Failed to create TCC state");
                eval_result->data = NULL;
                if (logic_konsolidasi)
                    g_free(logic_konsolidasi);

                if (sandi_revamp)
                    g_free(sandi_revamp);

                if (current_sandi_key)
                    g_free(current_sandi_key);

                return ILF_ERROR;
            }

            ILFResult *tcch_eval_result = g_malloc0(sizeof(ILFResult));

            ilf_status_t status = tcch_compile_code(logic_konsolidasi, tcc_state, tcch_eval_result);
            if (status != ILF_SUCCESS) {
                eval_result->status = ILF_ERROR;
                eval_result->error_message = g_strdup("TCC compilation failed");
                eval_result->data = NULL;
                tcc_delete(tcc_state);
                g_free(tcch_eval_result);
                if (logic_konsolidasi)
                    g_free(logic_konsolidasi);

                if (sandi_revamp)
                    g_free(sandi_revamp);

                if (current_sandi_key)
                    g_free(current_sandi_key);
                return ILF_ERROR;
            }

            if (!tcch_eval_result->data) {
                eval_result->status = ILF_ERROR;
                eval_result->error_message = g_strdup("Compiled function pointer is NULL");
                eval_result->data = NULL;
                tcc_delete(tcc_state);
                g_free(tcch_eval_result);
                if (logic_konsolidasi)
                    g_free(logic_konsolidasi);
                if (sandi_revamp)
                    g_free(sandi_revamp);

                if (current_sandi_key)
                    g_free(current_sandi_key);
                return ILF_ERROR;
            }

            gdouble (*f)(xmlDocPtr doc, xmlNodePtr cur, gpointer user_data, gpointer result)
                = tcch_eval_result->data;

            EvalContext *eval_ctx = g_malloc0(sizeof(EvalContext));
            eval_ctx->pic_doc = ctx->pic_doc;
            eval_ctx->memo = ctx->memo;
            gdouble eval_result_val = f(doc, cur, eval_ctx, NULL);

            printf("Evaluation sandi: %s result: %f\n", sandi_revamp, eval_result_val);

            // allocate a pointer to gdouble to store in hash table
            gdouble *valp = g_new(gdouble, 1);
            *valp = eval_result_val;

            // Replace the NULL value with actual result
            g_hash_table_replace(results_ht, g_strdup(sandi_revamp), valp);

            // create new xml element to store result of logicKonsolidasi

            xmlNodePtr result_node = xmlNewNode(NULL, (const xmlChar *) "logicKonsolidasiResult");
            xmlNodePtr value_node = xmlNewNode(NULL, (const xmlChar *) "value");
            xmlNodeSetContent(value_node, (const xmlChar *) g_strdup_printf("%f", eval_result_val));
            xmlAddChild(result_node, value_node);

            // Add the new element to the document
            xmlAddChild(cur, result_node);

            g_free(eval_ctx);
            tcc_delete(tcc_state);
            g_free(tcch_eval_result);
        }

        // Print the hash table contents for debugging

        // Process PIC xpath and update pic_doc if we have valid data
        if (pic && current_sandi_key) {
            const xmlChar *pic_q = (const xmlChar *) "/prmtr_company/DATA_RECORD[type=\"%s\"]";
            gchar *pic_xpath = NULL;

            if (g_strcmp0(pic, "All LJK") == 0) {
                pic_xpath = g_strdup_printf("/prmtr_company/DATA_RECORD[type=*]");
            } else if (g_strcmp0(pic, "Bank") == 0) {
                pic_xpath = g_strdup_printf((const char *) pic_q, "BANK");
            }

            if (pic_xpath) {
                printf("PIC XPath: %s\n", pic_xpath);

                xmlXPathContextPtr xpathCtx;
                xmlXPathObjectPtr xpathObj;

                xmlChar *xmlbuff;
                int buffersize;
                xmlDocDumpFormatMemory(cur->doc, &xmlbuff, &buffersize, 1);
                printf("dumpy %s", (char *) xmlbuff);
                xmlFree(xmlbuff);

                xpathCtx = xmlXPathNewContext(ctx->pic_doc);
                if (!xpathCtx) {
                    eval_result->status = ILF_ERROR;
                    eval_result->error_message = g_strdup("Failed to create XPath context");
                    eval_result->data = NULL;
                    if (pic)
                        g_free(pic);
                    if (sandi_revamp)
                        g_free(sandi_revamp);
                    if (current_sandi_key)
                        g_free(current_sandi_key);
                    g_free(pic_xpath);
                    return ILF_ERROR;
                }

                xpathObj = xmlXPathEvalExpression((const xmlChar *) pic_xpath, xpathCtx);
                if (!xpathObj) {
                    eval_result->status = ILF_ERROR;
                    eval_result->error_message = g_strdup("Failed to evaluate PIC XPath expression");
                    eval_result->data = NULL;
                    xmlXPathFreeContext(xpathCtx);
                    if (pic)
                        g_free(pic);
                    if (sandi_revamp)
                        g_free(sandi_revamp);
                    if (current_sandi_key)
                        g_free(current_sandi_key);
                    g_free(pic_xpath);
                    return ILF_ERROR;
                }

                // xPathObj contains xmlNodeSetPtr of matched nodes
                // we iterate through them and add new elements
                xmlNodeSetPtr nodes = xpathObj->nodesetval;
                if (nodes) {
                    printf("gokil\n");
                    for (int i = 0; i < nodes->nodeNr; i++) {
                        xmlNodePtr pic_node = nodes->nodeTab[i];

                        printf("Matched PIC node: %s\n", pic_node->name);

                        // Look up the result using current_sandi_key
                        gdouble *result_ptr
                            = (gdouble *) g_hash_table_lookup(results_ht, current_sandi_key);
                        if (result_ptr) {
                            // add new element containing sandiRevamp and evaluation result
                            xmlNodePtr new_elem = xmlNewChild(
                                pic_node, NULL, (const xmlChar *) "sourceInherentEvalResult", NULL);
                            xmlNewChild(new_elem, NULL, (const xmlChar *) "sandiRevamp",
                                        (const xmlChar *) current_sandi_key);

                            gchar *result_str = g_strdup_printf("%f", *result_ptr);
                            xmlNewChild(new_elem, NULL, (const xmlChar *) "result",
                                        (const xmlChar *) result_str);
                            g_free(result_str);
                        }
                    }
                }

                xmlXPathFreeObject(xpathObj);
                xmlXPathFreeContext(xpathCtx);
                g_free(pic_xpath);
            }
        }

        // Clean up per-record allocations
        if (sandi_revamp)
            g_free(sandi_revamp);
        if (pic)
            g_free(pic);
        if (current_sandi_key)
            g_free(current_sandi_key);

        // g_hash_table_foreach(results_ht, print_hash_tables, NULL);

        cur = cur->next;
    }

    // write back updated pic_doc to file
    eval_result->status = ILF_SUCCESS;
    eval_result->error_message = NULL;

    // Write the updated pic_doc back to the file
    int written = xmlSaveFile("updated_doc.xml", doc);

    if (written == -1) {
        eval_result->status = ILF_ERROR;
        eval_result->error_message = g_strdup("Failed to write updated doc XML document to file");
        eval_result->data = NULL;

        return ILF_ERROR;
    }

    return ILF_SUCCESS;
}

ilf_status_t
evaluate_risk_profile_tree(xmlDocPtr doc, gpointer user_data, gpointer result)
{
    if (!doc || !user_data || !result) {
        g_error("Invalid arguments to evaluate_risk_profile_tree");
        return ILF_ERROR;
    }

    ILFResult *eval_result = (ILFResult *) result;

    // build the tree
    EvalRiskProfileContext *ctx = (EvalRiskProfileContext *) user_data;
    if (!ctx->sandi_source_doc || !ctx->risk_profile_doc) {
        eval_result->status = ILF_ERROR;
        eval_result->error_message = g_strdup("User data XML documents are NULL");

        return ILF_ERROR;
    }

    GNode *risk_profile_tree = NULL;
    risk_profile_tree = build_risk_profile_tree(ctx->risk_profile_doc);
    if (!risk_profile_tree) {
        eval_result->status = ILF_ERROR;
        eval_result->error_message = g_strdup("Failed to build risk profile tree");
        return ILF_ERROR;
    }

    // traverse the tree and evaluate each node
    g_node_traverse(risk_profile_tree, G_POST_ORDER, G_TRAVERSE_ALL, -1, _fx_risk_profile,
                    (gpointer) ctx);

    eval_result->status = ILF_SUCCESS;
    eval_result->error_message = NULL;
    eval_result->data = risk_profile_tree;

    return ILF_SUCCESS;
}

/**
 * Helper function to get score from rating using rating_to_score.xml
 */
static gdouble
get_score_from_rating(xmlDocPtr rating_to_score_doc, gint rating)
{
    if (!rating_to_score_doc || rating < 1 || rating > 5) {
        return 0.0;
    }

    // Query XPath: //RatingScore[Rating='X']/Score
    xmlXPathContextPtr xpathCtx = xmlXPathNewContext(rating_to_score_doc);
    if (!xpathCtx)
        return 0.0;

    gchar *xpath = g_strdup_printf("//RatingScore[Rating='%d']/Score", rating);
    xmlXPathObjectPtr xpathObj = xmlXPathEvalExpression((const xmlChar *) xpath, xpathCtx);
    g_free(xpath);

    gdouble score = 0.0;
    if (xpathObj && xpathObj->nodesetval && xpathObj->nodesetval->nodeNr > 0) {
        xmlNodePtr scoreNode = xpathObj->nodesetval->nodeTab[0];
        xmlChar *content = xmlNodeGetContent(scoreNode);
        if (content) {
            score = g_ascii_strtod((const char *) content, NULL);
            xmlFree(content);
        }
    }

    if (xpathObj)
        xmlXPathFreeObject(xpathObj);
    xmlXPathFreeContext(xpathCtx);

    return score;
}

ilf_status_t
apply_rating_to_score_mapping(xmlDocPtr risk_profile_doc, xmlDocPtr rating_to_score_doc)
{
    if (!risk_profile_doc || !rating_to_score_doc) {
        g_error("Invalid arguments to apply_rating_to_score_mapping");
        return ILF_ERROR;
    }

    // Find all RiskProfile nodes with thresholdRating
    xmlXPathContextPtr xpathCtx = xmlXPathNewContext(risk_profile_doc);
    if (!xpathCtx) {
        return ILF_ERROR;
    }

    xmlXPathObjectPtr xpathObj
        = xmlXPathEvalExpression((const xmlChar *) "//RiskProfile[thresholdRating]", xpathCtx);

    if (!xpathObj || !xpathObj->nodesetval) {
        if (xpathObj)
            xmlXPathFreeObject(xpathObj);
        xmlXPathFreeContext(xpathCtx);
        return ILF_ERROR;
    }

    xmlNodeSetPtr nodeset = xpathObj->nodesetval;

    for (int i = 0; i < nodeset->nodeNr; i++) {
        xmlNodePtr riskProfileNode = nodeset->nodeTab[i];

        // 1. Get thresholdRating value
        xmlNodePtr ratingNode = NULL;
        xmlNodePtr child = riskProfileNode->children;
        gdouble rating_value = 0.0;

        while (child != NULL) {
            if (child->type == XML_ELEMENT_NODE
                && !xmlStrcmp(child->name, (const xmlChar *) "thresholdRating")) {
                ratingNode = child;

                // Get value from thresholdRating/value
                xmlNodePtr valueNode = child->children;
                while (valueNode != NULL) {
                    if (valueNode->type == XML_ELEMENT_NODE
                        && !xmlStrcmp(valueNode->name, (const xmlChar *) "value")) {
                        xmlChar *content = xmlNodeGetContent(valueNode);
                        if (content) {
                            rating_value = g_ascii_strtod((const char *) content, NULL);
                            xmlFree(content);
                        }
                        break;
                    }
                    valueNode = valueNode->next;
                }
                break;
            }
            child = child->next;
        }

        if (rating_value < 1.0 || rating_value > 5.0) {
            continue; // Skip invalid ratings
        }

        // 2. Map rating to score
        gint rating_int = (gint) rating_value;
        gdouble final_score = get_score_from_rating(rating_to_score_doc, rating_int);

        // 3. Get Sample_Bobot (weight) from RiskProfile
        gdouble weight = 0.0;
        child = riskProfileNode->children;
        while (child != NULL) {
            if (child->type == XML_ELEMENT_NODE
                && !xmlStrcmp(child->name, (const xmlChar *) "Sample_Bobot")) {
                xmlChar *content = xmlNodeGetContent(child);
                if (content) {
                    weight = g_ascii_strtod((const char *) content, NULL);
                    xmlFree(content);
                }
                break;
            }
            child = child->next;
        }

        // 4. Calculate score x weight
        gdouble score_x_weight = final_score * weight;

        // 5. Add finalScore and scoreXweight nodes to XML
        xmlNodePtr finalScoreNode
            = xmlNewChild(riskProfileNode, NULL, (const xmlChar *) "finalScore", NULL);
        if (finalScoreNode) {
            gchar score_str[32];
            snprintf(score_str, sizeof(score_str), "%.2f", final_score);
            xmlNewChild(finalScoreNode, NULL, (const xmlChar *) "value",
                        (const xmlChar *) score_str);
        }

        xmlNodePtr scoreXWeightNode
            = xmlNewChild(riskProfileNode, NULL, (const xmlChar *) "scoreXweight", NULL);
        if (scoreXWeightNode) {
            gchar sxw_str[32];
            snprintf(sxw_str, sizeof(sxw_str), "%.6f", score_x_weight);
            xmlNewChild(scoreXWeightNode, NULL, (const xmlChar *) "value",
                        (const xmlChar *) sxw_str);
        }

        g_print("Applied mapping: Rating=%.0f → Score=%.0f, Weight=%.2f → SxW=%.6f\n", rating_value,
                final_score, weight, score_x_weight);
    }

    xmlXPathFreeObject(xpathObj);
    xmlXPathFreeContext(xpathCtx);

    return ILF_SUCCESS;
}

ilf_status_t
save_risk_profile_result(xmlDocPtr risk_profile_doc, const char *output_path)
{
    if (!risk_profile_doc || !output_path) {
        g_error("Invalid arguments to save_risk_profile_result");
        return ILF_ERROR;
    }

    int result = xmlSaveFormatFileEnc(output_path, risk_profile_doc, "UTF-8", 1);

    if (result == -1) {
        g_error("Failed to save risk profile result to %s", output_path);
        return ILF_ERROR;
    }

    g_print("Saved risk profile result to: %s\n", output_path);
    return ILF_SUCCESS;
}
