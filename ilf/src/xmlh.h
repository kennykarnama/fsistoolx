/**
 * @file xmlh.h
 * @brief XML helper functions header.
 * This file is part of the ILF project.
 *
 */
#ifndef ILF_XMLH_H
#define ILF_XMLH_H

#include "hdr.h"

/**
 * Converts an xmlNodeSetPtr to a GArray of primitive string value
 * You must provide nodeset whose node type is XML_ELEMENT_NODE and only 1 element
 * @param doc The xmlDocPtr containing the document.
 * @param nodes The xmlNodeSetPtr to convert.
 * @param out_array Pointer to store the resulting GArray.
 * @return ILF_SUCCESS on success, ILF_ERROR on failure.
 */
ilf_status_t nodeset_to_array_str(xmlDocPtr doc, xmlNodeSetPtr nodes, GArray **out_array);

#endif // ILF_XMLH_H