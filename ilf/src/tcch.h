#ifndef ILF_TCC_H
#define ILF_TCC_H

#include "hdr.h"

/**
 * Handles TCC compilation errors by printing them to the provided file stream.
 * @param opaque A pointer to a FILE stream where errors will be printed.
 * @param msg The error message to be printed.
 * /
 */
void tcch_handle_error(void *opaque, const char *msg);
/**
 * Compiles the provided C code string using TCC and populates the result structure.
 * @param code The C code to compile.
 * @param s The TCCState context for compilation.
 * @param result A pointer to an ILFResult structure to store the compilation result.
 * @return ILF_SUCCESS on success, ILF_ERROR on failure.
 */
ilf_status_t tcch_compile_code(const char *code, TCCState *s, ILFResult *result);

#endif // ILF_TCC_H