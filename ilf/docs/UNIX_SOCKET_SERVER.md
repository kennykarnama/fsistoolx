# Unix Socket Server Documentation

## Overview

The ILF evaluation system now includes a Unix socket server that allows you to process risk profile evaluations as a service. This enables multiple clients to submit evaluation requests without starting a new process each time.

## Architecture

```
Client(s) → Unix Socket (/tmp/ilf_eval.sock) → Server → Pipeline → XML Output
```

### Components

1. **`eval_server`** - Unix socket server that:
   - Listens on `/tmp/ilf_eval.sock`
   - Accepts JSON commands
   - Processes evaluation requests
   - Returns JSON responses

2. **`eval_client`** - Command-line client that:
   - Connects to server via Unix socket
   - Sends JSON commands
   - Receives and displays responses

## Building

```bash
# Build server
make eval_server

# Build client
make eval_client

# Build both
make eval_server eval_client
```

## Server Usage

### Start Server

```bash
./eval_server
```

Output:
```
=== ILF Evaluation Server ===
Unix Socket: /tmp/ilf_eval.sock

[SERVER] Listening for connections...
[SERVER] Commands: evaluate, ping, shutdown
[SERVER] Press Ctrl+C to stop
```

### Start as Daemon (Background)

```bash
./eval_server &

# Or with nohup to persist after logout
nohup ./eval_server > eval_server.log 2>&1 &
```

### Stop Server

```bash
# Graceful shutdown via client
./eval_client shutdown

# Or send signal
kill -SIGTERM <pid>

# Or Ctrl+C if running in foreground
```

## Client Usage

### Check Server Status (Ping)

```bash
./eval_client ping
```

Response:
```json
{"status": "success", "message": "pong"}
```

### Evaluate Risk Profile

```bash
./eval_client evaluate \
  --risk-profile data/risk_profile_report_items.xml \
  --sandi-source data/source_inherent_out_fx_tests.xml \
  --rating-to-score data/rating_to_score.xml \
  --output server_output.xml
```

With optional PIC file:
```bash
./eval_client evaluate \
  --risk-profile data/risk_profile_report_items.xml \
  --sandi-source data/source_inherent_out.xml \
  --rating-to-score data/rating_to_score.xml \
  --output output.xml \
  --pic data/company_pic.xml
```

### Shutdown Server

```bash
./eval_client shutdown
```

## Protocol Specification

### Request Format (JSON)

#### Ping Command
```json
{
  "cmd": "ping"
}
```

#### Evaluate Command
```json
{
  "cmd": "evaluate",
  "risk_profile": "path/to/risk_profile.xml",
  "sandi_source": "path/to/sandi_source.xml",
  "rating_to_score": "path/to/rating_to_score.xml",
  "output": "path/to/output.xml",
  "pic": "path/to/pic.xml"  // Optional
}
```

#### Shutdown Command
```json
{
  "cmd": "shutdown"
}
```

### Response Format (JSON)

#### Success Response
```json
{
  "status": "success",
  "message": "Evaluation completed successfully. Tree nodes: 217",
  "output": "server_output.xml"
}
```

#### Error Response
```json
{
  "status": "error",
  "message": "Failed to parse risk profile XML: data/missing.xml"
}
```

## Example Session

### Terminal 1: Start Server
```bash
$ ./eval_server
=== ILF Evaluation Server ===
Unix Socket: /tmp/ilf_eval.sock

[SERVER] Listening for connections...
[SERVER] Commands: evaluate, ping, shutdown
[SERVER] Press Ctrl+C to stop
```

### Terminal 2: Use Client
```bash
# Test connection
$ ./eval_client ping
Request sent: {"cmd": "ping"}
Response:
{"status": "success", "message": "pong"}

# Run evaluation
$ ./eval_client evaluate \
    --risk-profile data/risk_profile_report_items.xml \
    --sandi-source data/source_inherent_out_fx_tests.xml \
    --rating-to-score data/rating_to_score.xml \
    --output result.xml

Request sent: {"cmd": "evaluate", ...}
Response:
{"status": "success", "message": "Evaluation completed successfully. Tree nodes: 217", "output": "result.xml"}

# Shutdown server
$ ./eval_client shutdown
Request sent: {"cmd": "shutdown"}
Response:
{"status": "success", "message": "Server shutting down"}
```

## Server Output Example

When processing an evaluation request:

```
[SERVER] Client connected
[SERVER] Received request: {"cmd": "evaluate", ...}
[SERVER] Processing evaluation request:
  Risk Profile: data/risk_profile_report_items.xml
  Sandi Source: data/source_inherent_out_fx_tests.xml
  Rating to Score: data/rating_to_score.xml
  Output: server_output.xml
[SERVER] All XML files loaded
[SERVER] Built tree with 217 nodes
Evaluated Risk Profile Fx for RI0100100300: Result: 8.250000
Evaluated Risk Profile Fx for RI0100100200: Result: 15.500000
Evaluated Risk Profile Fx for RI0100100100: Result: 9.120000
Evaluated Threshold Function for RI0100100100: Score=9.120000, Rating=5.000000
Evaluated Risk Profile Fx for RI0100100400: Result: 3.330000
Evaluated Risk Profile Fx for RI0100100000: Result: 36.200000
Evaluated Threshold Function for RI0100100000: Score=36.200000, Rating=4.000000
[SERVER] Risk profile evaluation completed
Applied mapping: Rating=4 → Score=44, Weight=0.28 → SxW=12.320000
Applied mapping: Rating=5 → Score=28, Weight=0.12 → SxW=3.360000
[SERVER] Rating-to-score mapping completed
Saved risk profile result to: server_output.xml
[SERVER] Output saved to: server_output.xml
[SERVER] Client disconnected
```

## Advanced Usage

### Programmatic Access (Custom Client)

You can create your own client in any language that supports Unix sockets:

#### Python Example
```python
import socket
import json

def send_command(cmd_dict):
    sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
    sock.connect("/tmp/ilf_eval.sock")
    
    request = json.dumps(cmd_dict)
    sock.send(request.encode())
    
    response = sock.recv(8192).decode()
    sock.close()
    
    return json.loads(response)

# Ping
result = send_command({"cmd": "ping"})
print(result)  # {'status': 'success', 'message': 'pong'}

# Evaluate
result = send_command({
    "cmd": "evaluate",
    "risk_profile": "data/risk_profile_report_items.xml",
    "sandi_source": "data/source_inherent_out_fx_tests.xml",
    "rating_to_score": "data/rating_to_score.xml",
    "output": "output.xml"
})
print(result)
```

#### Bash Example (using nc/socat)
```bash
# Using socat
echo '{"cmd": "ping"}' | socat - UNIX-CONNECT:/tmp/ilf_eval.sock

# Or nc (netcat) with Unix sockets
echo '{"cmd": "ping"}' | nc -U /tmp/ilf_eval.sock
```

### Integration with Web Services

You can wrap the server with a REST API:

```python
from flask import Flask, request, jsonify
import socket
import json

app = Flask(__name__)

def call_eval_server(cmd_dict):
    sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
    sock.connect("/tmp/ilf_eval.sock")
    sock.send(json.dumps(cmd_dict).encode())
    response = sock.recv(8192).decode()
    sock.close()
    return json.loads(response)

@app.route('/api/evaluate', methods=['POST'])
def evaluate():
    data = request.json
    result = call_eval_server({
        "cmd": "evaluate",
        "risk_profile": data['risk_profile'],
        "sandi_source": data['sandi_source'],
        "rating_to_score": data['rating_to_score'],
        "output": data['output']
    })
    return jsonify(result)

@app.route('/api/health', methods=['GET'])
def health():
    result = call_eval_server({"cmd": "ping"})
    return jsonify(result)
```

## Benefits of Server Architecture

### Performance
- **Faster startup**: Server loads once, processes multiple requests
- **Connection pooling**: Reuses resources across requests
- **Memory efficiency**: Shared XML parser and TCC state

### Scalability
- **Concurrent requests**: Can be extended to handle multiple clients
- **Queue management**: Easy to add request queuing
- **Load balancing**: Multiple servers can listen on different sockets

### Integration
- **Language agnostic**: Any language can use Unix sockets
- **Microservices**: Fits well in service-oriented architectures
- **Docker friendly**: Socket can be mounted as volume

## Comparison: CLI vs Server

| Feature | CLI (`eval_cli`) | Server (`eval_server` + `eval_client`) |
|---------|------------------|----------------------------------------|
| **Startup** | New process each time | Process runs continuously |
| **Performance** | ~1-2s per invocation | ~0.1-0.2s per request |
| **Memory** | Fresh memory per run | Shared memory |
| **Concurrency** | No state between runs | Can extend for concurrent handling |
| **Integration** | Shell scripts only | Any language via sockets |
| **Use Case** | One-off evaluations | Service/daemon mode |

## Troubleshooting

### Server won't start: "bind() failed"
```bash
# Socket file may already exist
rm /tmp/ilf_eval.sock
./eval_server
```

### Client can't connect: "connect() failed"
```bash
# Check if server is running
ps aux | grep eval_server

# Check if socket exists
ls -la /tmp/ilf_eval.sock

# Try starting server
./eval_server &
```

### Server crashes on evaluation
```bash
# Check server logs
tail -f eval_server.log  # If running with nohup

# Run server in foreground to see errors
./eval_server
```

### Memory issues
```bash
# Check memory usage
ps aux | grep eval_server | awk '{print $6}'

# Restart server periodically
./eval_client shutdown
sleep 1
./eval_server &
```

## Security Considerations

1. **Socket Permissions**: The socket file has default permissions. Restrict if needed:
   ```bash
   chmod 600 /tmp/ilf_eval.sock
   ```

2. **Input Validation**: Server validates required parameters but doesn't sanitize paths extensively. Ensure trusted clients only.

3. **File Access**: Server runs with user permissions. Ensure XML files are readable by server user.

4. **Resource Limits**: Consider implementing:
   - Request timeouts
   - Maximum concurrent connections
   - Rate limiting
   - Request size limits

## Future Enhancements

Potential improvements for production deployment:

- **Authentication**: Add token-based auth
- **Concurrent Processing**: Handle multiple clients simultaneously
- **Request Queue**: Implement job queue for long-running tasks
- **Status Endpoint**: Query ongoing evaluation status
- **Logging**: Structured logging to file/syslog
- **Metrics**: Prometheus metrics endpoint
- **Health Checks**: Liveness and readiness probes
- **Graceful Reload**: Reload configuration without downtime

## Summary

The Unix socket server provides a high-performance, integration-friendly way to run ILF evaluations as a service. It's ideal for:

- **Continuous operation**: Keep service running for rapid responses
- **Integration scenarios**: Easy to integrate with other systems
- **Production deployments**: Better resource management
- **API backends**: Can be wrapped with REST/gRPC interfaces

For simple, one-off evaluations, use `eval_cli`. For service/daemon mode, use `eval_server` + `eval_client`.
