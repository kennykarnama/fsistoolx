#include "xmlh.h"

ilf_status_t
nodeset_to_array_str(xmlDocPtr doc, xmlNodeSetPtr nodes, GArray **out_array)
{
    if (!nodes || !out_array) {
        g_error("Invalid arguments to nodeset_to_array");
        return ILF_ERROR;
    }

    GArray *array = g_array_new(FALSE, FALSE, sizeof(gchar *));
    if (!array) {
        g_error("Failed to create GArray in nodeset_to_array");
        return ILF_ERROR;
    }

    for (int i = 0; i < nodes->nodeNr; i++) {
        xmlNodePtr node = nodes->nodeTab[i];

        // get all the children, check if given node has more than 1 child
        // if it is then we return error
        if (node->type != XML_ELEMENT_NODE) {
            g_array_free(array, TRUE);
            g_error("nodeset_to_array_str: Node is not of type XML_ELEMENT_NODE");
            return ILF_ERROR;
        }

        xmlNodePtr cur = node->children;

        int child_counts = 0;

        gchar *result = NULL;

        while (cur != NULL) {
            if (cur->type == XML_ELEMENT_NODE) {
                child_counts++;
            }

            if ((!xmlStrcmp(cur->name, (const xmlChar *) "result"))) {
                xmlChar *result_x = xmlNodeListGetString(doc, cur->xmlChildrenNode, 1);
                if (result_x) {
                    result = g_strdup((const char *) result_x);
                    xmlFree(result_x);
                }
            }

            cur = cur->next;
        }

        if (!result || strlen(result) == 0) {
            // skip this node since no valid result child
            continue;
        }

        if (result && strlen(result) > 0) {
            g_array_append_val(array, result);
        } else if (result) {
            g_free(result);
        }
    }

    *out_array = array;

    return ILF_SUCCESS;
}