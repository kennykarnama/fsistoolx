/*
 * Unix socket server for ILF risk profile evaluation.
 * Accepts JSON commands via Unix domain socket and processes files.
 *
 * Protocol:
 * Request: {"cmd": "evaluate", "risk_profile": "path", "sandi_source": "path",
 *           "rating_to_score": "path", "output": "path", "pic": "path"}
 * Response: {"status": "success|error", "message": "...", "output": "path"}
 *
 * SPDX-License-Identifier: MIT
 * Author: Kenny Karnama <kennykarnama@gmail.com>
 */

#include <errno.h>
#include <glib.h>
#include<libxml/parser.h>
#include<libxml/tree.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <unistd.h>

#include "eval.h"
#include "risk_profile_tree.h"

#define SOCKET_PATH "/tmp/ilf_eval.sock"
#define BUFFER_SIZE 8192
#define MAX_PATH 1024

// Global server socket for cleanup
static int server_socket = -1;

/**
 * Signal handler for graceful shutdown
 */
static void
signal_handler(int signum)
{
    (void) signum;
    printf("\n[SERVER] Shutting down gracefully...\n");

    if (server_socket >= 0) {
        close(server_socket);
    }

    unlink(SOCKET_PATH);
    xmlCleanupParser();
    exit(0);
}

/**
 * Parse JSON command (simple implementation)
 * Returns allocated GHashTable with key-value pairs
 */
static GHashTable *
parse_json_command(const char *json)
{
    GHashTable *params = g_hash_table_new_full(g_str_hash, g_str_equal, g_free, g_free);

    // Simple JSON parser - extract "key": "value" pairs
    const char *p = json;
    while (*p) {
        // Find key
        const char *key_start = strchr(p, '"');
        if (!key_start)
            break;
        key_start++;

        const char *key_end = strchr(key_start, '"');
        if (!key_end)
            break;

        gchar *key = g_strndup(key_start, key_end - key_start);

        // Find value
        const char *value_start = strchr(key_end + 1, '"');
        if (!value_start) {
            g_free(key);
            break;
        }
        value_start++;

        const char *value_end = strchr(value_start, '"');
        if (!value_end) {
            g_free(key);
            break;
        }

        gchar *value = g_strndup(value_start, value_end - value_start);

        g_hash_table_insert(params, key, value);

        p = value_end + 1;
    }

    return params;
}

/**
 * Build JSON response
 */
static gchar *
build_json_response(const char *status, const char *message, const char *output_path)
{
    GString *json = g_string_new("{");

    g_string_append_printf(json, "\"status\": \"%s\"", status);

    if (message) {
        g_string_append_printf(json, ", \"message\": \"%s\"", message);
    }

    if (output_path) {
        g_string_append_printf(json, ", \"output\": \"%s\"", output_path);
    }

    g_string_append(json, "}");

    return g_string_free(json, FALSE);
}

/**
 * Process evaluation request
 */
static gchar *
process_evaluate_command(GHashTable *params)
{
    const char *risk_profile_path = g_hash_table_lookup(params, "risk_profile");
    const char *sandi_source_path = g_hash_table_lookup(params, "sandi_source");
    const char *rating_to_score_path = g_hash_table_lookup(params, "rating_to_score");
    const char *output_path = g_hash_table_lookup(params, "output");
    const char *pic_path = g_hash_table_lookup(params, "pic");

    // Validate required parameters
    if (!risk_profile_path || !sandi_source_path || !rating_to_score_path || !output_path) {
        return build_json_response(
            "error",
            "Missing required parameters: risk_profile, sandi_source, rating_to_score, output",
            NULL);
    }

    printf("[SERVER] Processing evaluation request:\n");
    printf("  Risk Profile: %s\n", risk_profile_path);
    printf("  Sandi Source: %s\n", sandi_source_path);
    printf("  Rating to Score: %s\n", rating_to_score_path);
    printf("  Output: %s\n", output_path);
    if (pic_path)
        printf("  PIC: %s\n", pic_path);

    // Step 1: Load XML files
    xmlDocPtr risk_profile_doc = xmlReadFile(risk_profile_path, NULL, 0);
    if (!risk_profile_doc) {
        gchar *msg = g_strdup_printf("Failed to parse risk profile XML: %s", risk_profile_path);
        gchar *response = build_json_response("error", msg, NULL);
        g_free(msg);
        return response;
    }

    xmlDocPtr sandi_source_doc = xmlReadFile(sandi_source_path, NULL, 0);
    if (!sandi_source_doc) {
        xmlFreeDoc(risk_profile_doc);
        gchar *msg = g_strdup_printf("Failed to parse sandi source XML: %s", sandi_source_path);
        gchar *response = build_json_response("error", msg, NULL);
        g_free(msg);
        return response;
    }

    xmlDocPtr rating_to_score_doc = xmlReadFile(rating_to_score_path, NULL, 0);
    if (!rating_to_score_doc) {
        xmlFreeDoc(risk_profile_doc);
        xmlFreeDoc(sandi_source_doc);
        gchar *msg
            = g_strdup_printf("Failed to parse rating-to-score XML: %s", rating_to_score_path);
        gchar *response = build_json_response("error", msg, NULL);
        g_free(msg);
        return response;
    }

    xmlDocPtr pic_doc = NULL;
    if (pic_path) {
        pic_doc = xmlReadFile(pic_path, NULL, 0);
        if (!pic_doc) {
            xmlFreeDoc(risk_profile_doc);
            xmlFreeDoc(sandi_source_doc);
            xmlFreeDoc(rating_to_score_doc);
            gchar *msg = g_strdup_printf("Failed to parse pic XML: %s", pic_path);
            gchar *response = build_json_response("error", msg, NULL);
            g_free(msg);
            return response;
        }
    } else {
        pic_doc = sandi_source_doc;
    }

    printf("[SERVER] All XML files loaded\n");

    // Step 2: Build risk profile tree
    GNode *risk_tree = build_risk_profile_tree(risk_profile_doc);
    if (!risk_tree) {
        xmlFreeDoc(risk_profile_doc);
        xmlFreeDoc(sandi_source_doc);
        xmlFreeDoc(rating_to_score_doc);
        if (pic_doc && pic_doc != sandi_source_doc)
            xmlFreeDoc(pic_doc);
        return build_json_response("error", "Failed to build risk profile tree", NULL);
    }

    guint node_count = g_node_n_nodes(risk_tree, G_TRAVERSE_ALL);
    printf("[SERVER] Built tree with %u nodes\n", node_count);

    // Step 3: Evaluate risk profile tree
    EvalRiskProfileContext ctx = { 0 };
    ctx.risk_profile_doc = risk_profile_doc;
    ctx.sandi_source_doc = sandi_source_doc;

    ILFResult res = { 0 };

    ilf_status_t status = evaluate_risk_profile_tree(risk_profile_doc, &ctx, &res);

    if (status != ILF_SUCCESS) {
        gchar *msg = g_strdup_printf("Evaluation failed: %s",
                                     res.error_message ? res.error_message : "Unknown error");
        gchar *response = build_json_response("error", msg, NULL);
        g_free(msg);

        // Cleanup
        if (res.error_message)
            free(res.error_message);
        if (res.data) {
            GNode *tree = (GNode *) res.data;
            g_node_destroy(tree);
        }
        g_node_destroy(risk_tree);
        xmlFreeDoc(risk_profile_doc);
        xmlFreeDoc(sandi_source_doc);
        xmlFreeDoc(rating_to_score_doc);
        if (pic_doc && pic_doc != sandi_source_doc)
            xmlFreeDoc(pic_doc);
        return response;
    }

    printf("[SERVER] Risk profile evaluation completed\n");

    // Step 4: Apply rating-to-score mapping
    status = apply_rating_to_score_mapping(risk_profile_doc, rating_to_score_doc);

    if (status != ILF_SUCCESS) {
        gchar *response = build_json_response("error", "Rating-to-score mapping failed", NULL);

        // Cleanup
        if (res.error_message)
            free(res.error_message);
        if (res.data) {
            GNode *tree = (GNode *) res.data;
            g_node_destroy(tree);
        }
        g_node_destroy(risk_tree);
        xmlFreeDoc(risk_profile_doc);
        xmlFreeDoc(sandi_source_doc);
        xmlFreeDoc(rating_to_score_doc);
        if (pic_doc && pic_doc != sandi_source_doc)
            xmlFreeDoc(pic_doc);
        return response;
    }

    printf("[SERVER] Rating-to-score mapping completed\n");

    // Step 5: Save output
    status = save_risk_profile_result(risk_profile_doc, output_path);

    if (status != ILF_SUCCESS) {
        gchar *response = build_json_response("error", "Failed to save output file", NULL);

        // Cleanup
        if (res.error_message)
            free(res.error_message);
        if (res.data) {
            GNode *tree = (GNode *) res.data;
            g_node_destroy(tree);
        }
        g_node_destroy(risk_tree);
        xmlFreeDoc(risk_profile_doc);
        xmlFreeDoc(sandi_source_doc);
        xmlFreeDoc(rating_to_score_doc);
        if (pic_doc && pic_doc != sandi_source_doc)
            xmlFreeDoc(pic_doc);
        return response;
    }

    printf("[SERVER] Output saved to: %s\n", output_path);

    // Cleanup
    if (res.error_message)
        free(res.error_message);
    if (res.data) {
        GNode *tree = (GNode *) res.data;
        g_node_destroy(tree);
    }
    g_node_destroy(risk_tree);
    xmlFreeDoc(risk_profile_doc);
    xmlFreeDoc(sandi_source_doc);
    xmlFreeDoc(rating_to_score_doc);
    if (pic_doc && pic_doc != sandi_source_doc)
        xmlFreeDoc(pic_doc);

    // Build success response
    gchar *msg = g_strdup_printf("Evaluation completed successfully. Tree nodes: %u", node_count);
    gchar *response = build_json_response("success", msg, output_path);
    g_free(msg);

    return response;
}

/**
 * Handle client connection
 */
static void
handle_client(int client_socket)
{
    char buffer[BUFFER_SIZE];
    ssize_t bytes_read = recv(client_socket, buffer, BUFFER_SIZE - 1, 0);

    if (bytes_read <= 0) {
        printf("[SERVER] Client disconnected or error reading\n");
        return;
    }

    buffer[bytes_read] = '\0';
    printf("[SERVER] Received request: %s\n", buffer);

    // Parse command
    GHashTable *params = parse_json_command(buffer);

    const char *cmd = g_hash_table_lookup(params, "cmd");
    gchar *response = NULL;

    if (!cmd) {
        response = build_json_response("error", "Missing 'cmd' field", NULL);
    } else if (strcmp(cmd, "evaluate") == 0) {
        response = process_evaluate_command(params);
    } else if (strcmp(cmd, "ping") == 0) {
        response = build_json_response("success", "pong", NULL);
    } else if (strcmp(cmd, "shutdown") == 0) {
        response = build_json_response("success", "Server shutting down", NULL);
        send(client_socket, response, strlen(response), 0);
        g_free(response);
        g_hash_table_destroy(params);
        printf("[SERVER] Shutdown command received\n");
        raise(SIGTERM);
        return;
    } else {
        gchar *msg = g_strdup_printf("Unknown command: %s", cmd);
        response = build_json_response("error", msg, NULL);
        g_free(msg);
    }

    // Send response
    send(client_socket, response, strlen(response), 0);

    g_free(response);
    g_hash_table_destroy(params);
}

int
main(int argc, char **argv)
{
    struct sockaddr_un server_addr, client_addr;
    socklen_t client_addr_len;

    // Setup signal handlers
    signal(SIGINT, signal_handler);
    signal(SIGTERM, signal_handler);

    printf("=== ILF Evaluation Server ===\n");
    printf("Unix Socket: %s\n\n", SOCKET_PATH);

    // Remove existing socket file
    unlink(SOCKET_PATH);

    // Create Unix domain socket
    server_socket = socket(AF_UNIX, SOCK_STREAM, 0);
    if (server_socket < 0) {
        perror("socket() failed");
        return 1;
    }

    // Setup server address
    memset(&server_addr, 0, sizeof(server_addr));
    server_addr.sun_family = AF_UNIX;
    strncpy(server_addr.sun_path, SOCKET_PATH, sizeof(server_addr.sun_path) - 1);

    // Bind socket
    if (bind(server_socket, (struct sockaddr *) &server_addr, sizeof(server_addr)) < 0) {
        perror("bind() failed");
        close(server_socket);
        return 1;
    }

    // Listen for connections
    if (listen(server_socket, 5) < 0) {
        perror("listen() failed");
        close(server_socket);
        unlink(SOCKET_PATH);
        return 1;
    }

    printf("[SERVER] Listening for connections...\n");
    printf("[SERVER] Commands: evaluate, ping, shutdown\n");
    printf("[SERVER] Press Ctrl+C to stop\n\n");

    // Accept client connections
    while (1) {
        client_addr_len = sizeof(client_addr);
        int client_socket
            = accept(server_socket, (struct sockaddr *) &client_addr, &client_addr_len);

        if (client_socket < 0) {
            if (errno == EINTR) {
                // Interrupted by signal
                break;
            }
            perror("accept() failed");
            continue;
        }

        printf("[SERVER] Client connected\n");

        // Handle client (synchronous for simplicity)
        handle_client(client_socket);

        close(client_socket);
        printf("[SERVER] Client disconnected\n\n");
    }

    // Cleanup
    close(server_socket);
    unlink(SOCKET_PATH);
    xmlCleanupParser();

    printf("[SERVER] Server stopped\n");

    return 0;
}
