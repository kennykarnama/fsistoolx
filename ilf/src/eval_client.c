/*
 * Client utility for ILF evaluation server.
 * Sends commands via Unix domain socket and receives responses.
 *
 * Usage:
 *   eval_client ping
 *   eval_client evaluate --risk-profile <file> --sandi-source <file> \
 *                         --rating-to-score <file> --output <file> [--pic <file>]
 *   eval_client shutdown
 *
 * SPDX-License-Identifier: MIT
 * Author: Kenny Karnama <kennykarnama@gmail.com>
 */

#include <glib.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <unistd.h>

#define SOCKET_PATH "/tmp/ilf_eval.sock"
#define BUFFER_SIZE 8192

static void
print_usage(const char *prog)
{
    fprintf(stderr, "ILF Evaluation Client\n");
    fprintf(stderr, "=====================\n\n");
    fprintf(stderr, "Usage:\n");
    fprintf(stderr, "  %s ping\n", prog);
    fprintf(stderr, "  %s evaluate --risk-profile <file> --sandi-source <file> \\\n", prog);
    fprintf(stderr,
            "                      --rating-to-score <file> --output <file> [--pic <file>]\n");
    fprintf(stderr, "  %s shutdown\n\n", prog);
    fprintf(stderr, "Examples:\n");
    fprintf(stderr, "  # Check if server is running\n");
    fprintf(stderr, "  %s ping\n\n", prog);
    fprintf(stderr, "  # Evaluate risk profile\n");
    fprintf(stderr, "  %s evaluate \\\n", prog);
    fprintf(stderr, "    --risk-profile data/risk_profile_report_items.xml \\\n");
    fprintf(stderr, "    --sandi-source data/source_inherent_out_fx_tests.xml \\\n");
    fprintf(stderr, "    --rating-to-score data/rating_to_score.xml \\\n");
    fprintf(stderr, "    --output server_output.xml\n\n");
    fprintf(stderr, "  # Shutdown server\n");
    fprintf(stderr, "  %s shutdown\n", prog);
}

static gchar *
build_evaluate_json(const char *risk_profile, const char *sandi_source, const char *rating_to_score,
                    const char *output, const char *pic)
{
    GString *json = g_string_new("{");

    g_string_append_printf(json, "\"cmd\": \"evaluate\"");
    g_string_append_printf(json, ", \"risk_profile\": \"%s\"", risk_profile);
    g_string_append_printf(json, ", \"sandi_source\": \"%s\"", sandi_source);
    g_string_append_printf(json, ", \"rating_to_score\": \"%s\"", rating_to_score);
    g_string_append_printf(json, ", \"output\": \"%s\"", output);

    if (pic) {
        g_string_append_printf(json, ", \"pic\": \"%s\"", pic);
    }

    g_string_append(json, "}");

    return g_string_free(json, FALSE);
}

static int
send_command(const char *command_json)
{
    int client_socket;
    struct sockaddr_un server_addr;
    char buffer[BUFFER_SIZE];

    // Create socket
    client_socket = socket(AF_UNIX, SOCK_STREAM, 0);
    if (client_socket < 0) {
        perror("socket() failed");
        return 1;
    }

    // Setup server address
    memset(&server_addr, 0, sizeof(server_addr));
    server_addr.sun_family = AF_UNIX;
    strncpy(server_addr.sun_path, SOCKET_PATH, sizeof(server_addr.sun_path) - 1);

    // Connect to server
    if (connect(client_socket, (struct sockaddr *) &server_addr, sizeof(server_addr)) < 0) {
        perror("connect() failed - Is the server running?");
        close(client_socket);
        return 1;
    }

    // Send command
    ssize_t bytes_sent = send(client_socket, command_json, strlen(command_json), 0);
    if (bytes_sent < 0) {
        perror("send() failed");
        close(client_socket);
        return 1;
    }

    printf("Request sent: %s\n\n", command_json);

    // Receive response
    ssize_t bytes_received = recv(client_socket, buffer, BUFFER_SIZE - 1, 0);
    if (bytes_received < 0) {
        perror("recv() failed");
        close(client_socket);
        return 1;
    }

    buffer[bytes_received] = '\0';

    printf("Response:\n%s\n", buffer);

    // Close socket
    close(client_socket);

    // Parse response to check status
    if (strstr(buffer, "\"status\": \"error\"")) {
        return 1;
    }

    return 0;
}

int
main(int argc, char **argv)
{
    if (argc < 2) {
        print_usage(argv[0]);
        return 1;
    }

    const char *cmd = argv[1];

    if (strcmp(cmd, "--help") == 0 || strcmp(cmd, "-h") == 0) {
        print_usage(argv[0]);
        return 0;
    }

    gchar *command_json = NULL;

    if (strcmp(cmd, "ping") == 0) {
        command_json = g_strdup("{\"cmd\": \"ping\"}");
    } else if (strcmp(cmd, "shutdown") == 0) {
        command_json = g_strdup("{\"cmd\": \"shutdown\"}");
    } else if (strcmp(cmd, "evaluate") == 0) {
        // Parse evaluate arguments
        const char *risk_profile = NULL;
        const char *sandi_source = NULL;
        const char *rating_to_score = NULL;
        const char *output = NULL;
        const char *pic = NULL;

        for (int i = 2; i < argc; i++) {
            if (strcmp(argv[i], "--risk-profile") == 0 && i + 1 < argc) {
                risk_profile = argv[++i];
            } else if (strcmp(argv[i], "--sandi-source") == 0 && i + 1 < argc) {
                sandi_source = argv[++i];
            } else if (strcmp(argv[i], "--rating-to-score") == 0 && i + 1 < argc) {
                rating_to_score = argv[++i];
            } else if (strcmp(argv[i], "--output") == 0 && i + 1 < argc) {
                output = argv[++i];
            } else if (strcmp(argv[i], "--pic") == 0 && i + 1 < argc) {
                pic = argv[++i];
            }
        }

        // Validate required parameters
        if (!risk_profile || !sandi_source || !rating_to_score || !output) {
            fprintf(stderr, "Error: Missing required parameters for evaluate command\n\n");
            print_usage(argv[0]);
            return 1;
        }

        command_json
            = build_evaluate_json(risk_profile, sandi_source, rating_to_score, output, pic);
    } else {
        fprintf(stderr, "Error: Unknown command: %s\n\n", cmd);
        print_usage(argv[0]);
        return 1;
    }

    // Send command to server
    int result = send_command(command_json);

    g_free(command_json);

    return result;
}
