#include "parser.h"

/**
 * Parses a sourceInherentRevampReport XML node and stores it in the provided hash table.
 * @param doc The XML document.
 * @param node The XML node to parse.
 * @param memo A GHashTable to store parsed records, keyed by their 'sandiRevamp' attribute.
 * @return ILF_SUCCESS on success, ILF_ERROR on failure.
 */
ilf_status_t
parse_sourceinherent_node_to_ht(xmlDocPtr doc, xmlNodePtr node, GHashTable *memo)
{
    if (!node || !memo) {
        g_error("Invalid arguments to parse_sourceinherent_node_to_ht");

        return ILF_ERROR;
    }

    node = node->xmlChildrenNode;

    while (node != NULL) {
        if ((!xmlStrcmp(node->name, (const xmlChar *) "logicLjk"))) {
            xmlChar *ljk_script = xmlNodeListGetString(doc, node->xmlChildrenNode, 1);

            if (!ljk_script) {
                continue;
            }

            printf("ljk script: %s\n", ljk_script);
        }

        if ((!xmlStrcmp(node->name, (const xmlChar *) "logicKonsolidasi"))) {
            xmlChar *konsol_script = xmlNodeListGetString(doc, node->xmlChildrenNode, 1);

            if (!konsol_script) {
                continue;
            }

            printf("konsol script: %s\n", konsol_script);
        }

        if (!xmlStrcmp(node->name, (const xmlChar *) "sandiRevamp")) {
            xmlChar *sandi_revamp = xmlNodeListGetString(doc, node->xmlChildrenNode, 1);

            if (!sandi_revamp) {
                continue;
            }

            printf("sandiRevamp: %s\n", sandi_revamp);

            g_hash_table_insert(memo, g_strdup(sandi_revamp),
                                "foo"); // TODO: replace "foo" with actual data structure
        }

        node = node->next;
    }

    return ILF_SUCCESS;
}

/**
 * Parses the provided XML document.
 * result is a pointer to an ILFResult structure to store the parsing result.
 * In the current implementation, ILFResult->data type is
 * https://docs.gtk.org/glib/struct.HashTable.html Caller is responsible for freeing the associated
 * memory.
 * @param doc The XML document to parse.
 * @param result A pointer to an ILFResult structure to store the parsing result.
 * @return ILF_SUCCESS on success, ILF_ERROR on failure.
 */
ilf_status_t
parse_xml_sourceinherent(xmlDocPtr doc, ILFResult **result)
{
    if (!doc || !result) {
        g_error("Invalid arguments to parse_xml");

        return ILF_ERROR;
    }

    GHashTable *memo = (*result)->data;
    if (!memo) {
        (*result)->status = ILF_ERROR;
        (*result)->error_message = g_strdup("ILFResult data is NULL");
        (*result)->data = NULL;

        return ILF_ERROR;
    }

    xmlNodePtr cur;

    cur = xmlDocGetRootElement(doc);

    if (cur == NULL) {
        (*result)->status = ILF_ERROR;
        (*result)->error_message = g_strdup("Empty XML document");
        (*result)->data = NULL;

        return ILF_ERROR;
    }

    if (xmlStrcmp(cur->name, (const xmlChar *) "sourceInherentRevampReport")) {
        (*result)->status = ILF_ERROR;
        (*result)->error_message = g_strdup("Document of the wrong type");
        (*result)->data = NULL;

        return ILF_ERROR;
    }

    cur = cur->xmlChildrenNode;
    while (cur != NULL) {
        ilf_status_t status = parse_sourceinherent_node_to_ht(doc, cur, memo);
        if (status != ILF_SUCCESS) {
            (*result)->status = ILF_ERROR;
            (*result)->error_message = g_strdup("Failed to parse record node");
            (*result)->data = NULL;

            return ILF_ERROR;
        }

        cur = cur->next;
    }

    return ILF_SUCCESS;
}