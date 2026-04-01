#include "tcch.h"
#include "gslh.h"
#include "xmlh.h"

void
tcch_handle_error(void *opaque, const char *msg)
{
    FILE *f = (FILE *) opaque;
    fprintf(f, "TCC Error: %s\n", msg);
}

ilf_status_t
tcch_compile_code(const char *code, TCCState *s, ILFResult *result)
{
    if (!s) {
        result->status = ILF_ERROR;
        result->error_message = g_strdup("TCCState is NULL");
        result->data = NULL;

        return ILF_ERROR;
    }

    tcc_set_error_func(s, stderr, tcch_handle_error);

    tcc_set_output_type(s, TCC_OUTPUT_MEMORY);

    /*
     * Include glib and json-glib paths and libraries
     * this marks what we need to compile and link against
     */
    tcc_add_include_path(s, "src"); // Add local src directory for xmlh.h, gslh.h, eval.h
    tcc_add_include_path(s, "/usr/include/glib-2.0");
    tcc_add_include_path(s, "/usr/lib/x86_64-linux-gnu/glib-2.0/include");
    tcc_add_include_path(s, "/usr/include/libxml2");
    tcc_add_library(s, "glib-2.0");
    tcc_add_library(s, "gio-2.0");
    tcc_add_library(s, "gobject-2.0");
    tcc_add_library(s, "gsl");
    tcc_add_library(s, "gslcblas");
    tcc_add_library(s, "m");
    tcc_add_library(s, "xml2");

    // Add symbols for our helper functions so dynamically compiled code can call them
    tcc_add_symbol(s, "nodeset_to_array_str", nodeset_to_array_str);
    tcc_add_symbol(s, "garraydouble_gsl_vector", garraydouble_gsl_vector);

    if (tcc_compile_string(s, code) < 0) {
        result->status = ILF_ERROR;
        result->error_message = g_strdup("Compilation failed");
        result->data = NULL;

        return ILF_ERROR;
    }

    if (tcc_relocate(s) < 0) {
        result->status = ILF_ERROR;
        result->error_message = g_strdup("Relocation failed");
        result->data = NULL;

        return ILF_ERROR;
    }

    gdouble (*f)(xmlDocPtr doc, xmlNodePtr cur, gpointer user_data, gpointer result)
        = tcc_get_symbol(s, "fx");
    if (!f) {
        result->status = ILF_ERROR;
        result->error_message = g_strdup("Failed to get symbol 'fx'");
        result->data = NULL;

        return ILF_ERROR;
    }

    result->status = ILF_SUCCESS;
    result->error_message = NULL;
    result->data = f;

    return ILF_SUCCESS;
}