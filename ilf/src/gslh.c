#include "gslh.h"

ilf_status_t
garraydouble_gsl_vector(GArray *array, gsl_vector **out_vector)
{
    if (!array || !out_vector) {
        g_error("Invalid arguments to garraydouble_gsl_vector");
        return ILF_ERROR;
    }

    gsl_vector *vector = gsl_vector_alloc(array->len);
    if (!vector) {
        g_error("Failed to allocate gsl_vector in garraydouble_gsl_vector");
        return ILF_ERROR;
    }

    for (guint i = 0; i < array->len; i++) {
        double value = g_array_index(array, double, i);
        gsl_vector_set(vector, i, value);
    }

    *out_vector = vector;
    return ILF_SUCCESS;
}