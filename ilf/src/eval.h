#ifndef ILF_EVAL_H
#define ILF_EVAL_H

#include "hdr.h"

/* Evaluation context structure */
typedef struct eval_context_t {
    xmlDocPtr pic_doc;
    xmlDocPtr worksheet_detail; // we need this so we can infer the input from ljk
    GHashTable *memo;

} EvalContext;

/**
 * Risk Profile Tree Evaluation Context
 * Holds XML documents needed for risk profile tree evaluation
 * - sandi_source_doc: XML document containing source inherent data with sandiRevamp
 * - risk_profile_doc: XML document containing RiskProfile elements
 */
typedef struct eval_risk_profile_context_t {
    xmlDocPtr sandi_source_doc;
    xmlDocPtr risk_profile_doc;
} EvalRiskProfileContext;

/**
 * Evaluates source inherent logic from the provided XML document.
 * This function evaluates ljk logic for each record in the sourceInherentRevampReport
 * and updates the pic_doc XML document accordingly.
 * @param doc The XML document to evaluate.
 * @param user_data User data to be passed to the evaluation function.
 * @param result A pointer to store the evaluation result.
 * @return ILF_SUCCESS on success, ILF_ERROR on failure.
 */
ilf_status_t evaluate_src_inherent(xmlDocPtr doc, gpointer user_data, gpointer result);

/**
 * Evaluates konsolidasi inherent logic from the provided XML document.
 * @param doc The XML document to evaluate.
 * @param user_data User data to be passed to the evaluation function.
 * @param result A pointer to store the evaluation result.
 * @return ILF_SUCCESS on success, ILF_ERROR on failure.
 */
ilf_status_t evaluate_konsolidasi_inherent(xmlDocPtr doc, gpointer user_data, gpointer result);

/*
 * Evaluates risk profile tree logic from the provided XML document.
 * @param doc The XML document to evaluate.
 * @param user_data User data to be passed to the evaluation function. This will be of type
 * EvalRiskProfileContext.
 * @param result A pointer to store the evaluation result.
 * @return ILF_SUCCESS on success, ILF_ERROR on failure.
 */
ilf_status_t evaluate_risk_profile_tree(xmlDocPtr doc, gpointer user_data, gpointer result);

/**
 * Apply rating-to-score mapping and calculate final weighted scores.
 * This function:
 * 1. Reads the thresholdRating from evaluated risk profile nodes
 * 2. Maps rating (1-5) to score using rating_to_score.xml
 * 3. Reads Sample_Bobot (weight) from the risk profile
 * 4. Calculates finalScore and scoreXweight (score * bobot)
 * 5. Adds these values to the XML
 *
 * @param risk_profile_doc The evaluated risk profile document (with thresholdRating)
 * @param rating_to_score_doc The rating to score mapping document
 * @return ILF_SUCCESS on success, ILF_ERROR on failure.
 */
ilf_status_t apply_rating_to_score_mapping(xmlDocPtr risk_profile_doc,
                                           xmlDocPtr rating_to_score_doc);

/**
 * Save the evaluated risk profile document to a file.
 * @param risk_profile_doc The document to save
 * @param output_path The output file path
 * @return ILF_SUCCESS on success, ILF_ERROR on failure.
 */
ilf_status_t save_risk_profile_result(xmlDocPtr risk_profile_doc, const char *output_path);

#endif