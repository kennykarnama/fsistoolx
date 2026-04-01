#include "glibh.h"

void
print_hash_tables(gpointer key, gpointer value, gpointer user_data)
{
    g_print("Key: %s, Value: %f\n", (char *) key, *((gdouble *) value));
}