#ifndef ILF_PARSER_H
#define ILF_PARSER_H

#include "hdr.h"
#include "tcch.h"

/**
 * Parses the provided XML document.
 * @param doc The XML document to parse.
 * @param result A pointer to an ILFResult structure to store the parsing result.
 * @return ILF_SUCCESS on success, ILF_ERROR on failure.
 */
ilf_status_t parse_xml_sourceinherent(xmlDocPtr doc, ILFResult **result);

/**
 * Parses a single <record> node and inserts it into the memo hash table keyed by 'sandiRevamp'.
 * @param doc The XML document containing the node.
 * @param node The <record> XML node to parse.
 * @param memo The hash table to insert the parsed record into.
 * @return ILF_SUCCESS on success, ILF_ERROR on failure.
 */
ilf_status_t parse_sourceinherent_node_to_ht(xmlDocPtr doc, xmlNodePtr node, GHashTable *memo);

#endif