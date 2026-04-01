#ifndef ILF_GSLH_H
#define ILF_GSLH_H

#include "hdr.h"

/**
 * Converts a GArray of doubles to a gsl_vector.
 * @param array The GArray to convert.
 * @param out_vector Pointer to store the resulting gsl_vector.
 * @return ILF_SUCCESS on success, ILF_ERROR on failure.
 */
ilf_status_t garraydouble_gsl_vector(GArray *array, gsl_vector **out_vector);

#endif // ILF_GSLH_H