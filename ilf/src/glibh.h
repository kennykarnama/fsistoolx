/* glibh.h - Header file for GLib helper functions
 * This file is part of the ILF project.
 * SPDX-License-Identifier: MIT
 */
#ifndef ILF_GLIBH_H
#define ILF_GLIBH_H

#include "hdr.h"

/**
 * Prints the contents of a hash table entry.
 * @param key The key of the hash table entry.
 * @param value The value of the hash table entry.
 * @param user_data Additional user data (unused).
 */
void print_hash_tables(gpointer key, gpointer value, gpointer user_data);

#endif // ILF_GLIBH_H