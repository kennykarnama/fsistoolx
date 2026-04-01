/* Unified test runner that invokes individual GLib test binaries.
 * Each test binary returns number of failed tests (0 = success).
 */
#include <glib.h>
#include <stdio.h>

typedef struct {
    const char *name;  /* Logical name */
    const char *path;  /* Relative executable path */
    char *const *argv; /* Argument vector (NULL terminated) */
} TestBinary;

static int
run_one_test(const TestBinary *tb, gboolean verbose)
{
    gchar *stdout_buf = NULL;
    gchar *stderr_buf = NULL;
    gint exit_status = 0;
    GError *error = NULL;

    /* Build argument list dynamically if verbose requested */
    GPtrArray *args = g_ptr_array_new();
    g_ptr_array_add(args, (gpointer) tb->path);
    if (verbose) {
        g_ptr_array_add(args, (gpointer) "--verbose");
    }
    g_ptr_array_add(args, NULL);

    g_print("[ RUN    ] %s\n", tb->name);
    gboolean ok = g_spawn_sync(NULL, (gchar **) args->pdata, NULL, G_SPAWN_SEARCH_PATH, NULL, NULL,
                               &stdout_buf, &stderr_buf, &exit_status, &error);

    g_ptr_array_free(args, TRUE);

    if (!ok) {
        g_printerr("[ ERROR  ] %s: spawn failed: %s\n", tb->name,
                   error ? error->message : "unknown");
        if (error)
            g_error_free(error);
        g_free(stdout_buf);
        g_free(stderr_buf);
        return 1; /* treat as failure */
    }

    /* GLib test programs exit with number of failed tests; non-zero means failures */
    if (exit_status == 0) {
        g_print("[   OK   ] %s\n", tb->name);
    } else {
        g_print("[FAILED  ] %s (exit status %d)\n", tb->name, exit_status);
    }

    if (stdout_buf && *stdout_buf) {
        g_print("----- %s stdout -----\n%s---------------------------\n", tb->name, stdout_buf);
    }
    if (stderr_buf && *stderr_buf) {
        g_print("----- %s stderr -----\n%s---------------------------\n", tb->name, stderr_buf);
    }
    g_free(stdout_buf);
    g_free(stderr_buf);
    return exit_status == 0 ? 0 : 1;
}

int
main(int argc, char **argv)
{
    gboolean verbose = FALSE;
    for (int i = 1; i < argc; ++i) {
        if (g_strcmp0(argv[i], "--verbose") == 0)
            verbose = TRUE;
    }

    const TestBinary tests[] = {
        { "parser_tests", "./parser_tests", NULL },
        { "tcch_tests", "./tcch_tests", NULL },
        { "eval_tests", "./eval_tests", NULL },
    };
    const size_t n_tests = G_N_ELEMENTS(tests);

    g_print("[ START  ] Running %zu test binaries\n", n_tests);
    int failures = 0;
    for (size_t i = 0; i < n_tests; ++i) {
        failures += run_one_test(&tests[i], verbose);
    }

    if (failures == 0) {
        g_print("[ SUCCESS] All test binaries passed\n");
    } else {
        g_print("[ SUMMARY] %d test binaries failed\n", failures);
    }
    return failures == 0 ? 0 : failures;
}