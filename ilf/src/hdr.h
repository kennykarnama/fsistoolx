/* hdr.h - Header file for ILF project
 *
 * This file is part of the ILF project.
 *
 * SPDX-License-Identifier: MIT
 */
#ifndef ILF_HDR_H
#define ILF_HDR_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <glib.h>
#include <gsl/gsl_statistics.h>
#include <gsl/gsl_vector.h>
#include <libtcc.h>
#include<libxml/parser.h>
#include<libxml/xmlmemory.h>
#include<libxml/xpath.h>
#include<libxml/xpathInternals.h>

/* Status codes */
typedef enum { ILF_SUCCESS = 0, ILF_ERROR = 1 } ilf_status_t;

/* Result structure */
typedef struct ilf_result_t {
    ilf_status_t status;
    char *error_message;
    void *data;
} ILFResult;

#endif // ILF_HDR_H