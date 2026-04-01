# Docker Deployment Guide for ILF Evaluation Server

## Overview

This guide covers deploying the ILF Evaluation Server using Docker and Docker Compose.

## Quick Start

### Using Docker Compose (Recommended)

```bash
# Build and start the server
docker-compose up -d ilf-server

# Check server status
docker-compose logs -f ilf-server

# Use client to test
docker-compose run --rm ilf-client ping

# Run evaluation
docker-compose run --rm ilf-client evaluate \
  --risk-profile /app/data/risk_profile_report_items.xml \
  --sandi-source /app/data/source_inherent_out_fx_tests.xml \
  --rating-to-score /app/data/rating_to_score.xml \
  --output /app/output/result.xml

# Stop server
docker-compose down
```

### Using Docker CLI

```bash
# Build the image
docker build -t ilf-eval-server:latest .

# Run the server
docker run -d \
  --name ilf-server \
  -v ilf-socket:/tmp \
  -v $(pwd)/output:/app/output \
  ilf-eval-server:latest

# Check logs
docker logs -f ilf-server

# Stop server
docker stop ilf-server
docker rm ilf-server
```

## Architecture

### Multi-Stage Build

The Dockerfile uses a multi-stage build to minimize the final image size:

1. **Builder Stage**: Compiles the server with all build tools
2. **Runtime Stage**: Contains only runtime dependencies and the binary

### Volumes

| Volume | Purpose | Mount Point |
|--------|---------|-------------|
| `ilf-socket` | Unix socket for client-server communication | `/tmp` |
| `output` | Evaluation results | `/app/output` |
| `data` | Input data files | `/app/data` |

## Build Options

### Standard Build

```bash
docker build -t ilf-eval-server:latest .
```

### Build with Custom Tag

```bash
docker build -t myregistry/ilf-eval-server:v1.0 .
```

### Build Both Server and Client

```bash
docker build -t ilf-eval-server:latest .
docker build -f Dockerfile.client -t ilf-eval-client:latest .
```

## Running the Server

### Basic Run

```bash
docker run -d \
  --name ilf-server \
  -v ilf-socket:/tmp \
  ilf-eval-server:latest
```

### With Custom Data Directory

```bash
docker run -d \
  --name ilf-server \
  -v ilf-socket:/tmp \
  -v $(pwd)/custom-data:/app/data \
  -v $(pwd)/output:/app/output \
  ilf-eval-server:latest
```

### With Logs

```bash
docker run -d \
  --name ilf-server \
  -v ilf-socket:/tmp \
  -v $(pwd)/output:/app/output \
  -v $(pwd)/logs:/var/log \
  ilf-eval-server:latest > /var/log/ilf-server.log 2>&1
```

## Using the Client

### Build Client Image

```bash
docker build -f Dockerfile.client -t ilf-eval-client:latest .
```

### Run Client Commands

```bash
# Ping server
docker run --rm \
  -v ilf-socket:/tmp \
  ilf-eval-client:latest ping

# Evaluate
docker run --rm \
  -v ilf-socket:/tmp \
  -v $(pwd)/data:/app/data \
  -v $(pwd)/output:/app/output \
  ilf-eval-client:latest evaluate \
    --risk-profile /app/data/risk_profile_report_items.xml \
    --sandi-source /app/data/source_inherent_out_fx_tests.xml \
    --rating-to-score /app/data/rating_to_score.xml \
    --output /app/output/result.xml

# Shutdown server
docker run --rm \
  -v ilf-socket:/tmp \
  ilf-eval-client:latest shutdown
```

## Docker Compose

### Services

#### ilf-server
Main evaluation server service that runs continuously.

#### ilf-client
Client utility for interacting with the server (profile: tools).

### Start Services

```bash
# Start server only
docker-compose up -d ilf-server

# Start in foreground (see logs)
docker-compose up ilf-server
```

### Use Client

```bash
# Run client commands (requires --rm flag)
docker-compose run --rm ilf-client ping
docker-compose run --rm ilf-client evaluate [OPTIONS]
docker-compose run --rm ilf-client shutdown
```

### View Logs

```bash
# Follow logs
docker-compose logs -f ilf-server

# Show last 100 lines
docker-compose logs --tail=100 ilf-server
```

### Stop Services

```bash
# Stop all services
docker-compose down

# Stop and remove volumes
docker-compose down -v
```

## Environment Variables

Add environment variables to docker-compose.yml or use .env file:

```yaml
environment:
  - SOCKET_PATH=/tmp/ilf_eval.sock
  - LOG_LEVEL=info
  - MAX_CONNECTIONS=10
```

## Health Checks

### Manual Health Check

```bash
# From host
docker exec ilf-server ps aux | grep eval_server

# Using client
docker-compose run --rm ilf-client ping
```

### Automatic Health Check (Optional)

Uncomment the HEALTHCHECK section in Dockerfile:

```dockerfile
RUN apt-get update && apt-get install -y socat && rm -rf /var/lib/apt/lists/*
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD echo '{"cmd":"ping"}' | socat - UNIX-CONNECT:/tmp/ilf_eval.sock || exit 1
```

Rebuild the image after changes.

## Production Deployment

### With Restart Policy

```bash
docker run -d \
  --name ilf-server \
  --restart unless-stopped \
  -v ilf-socket:/tmp \
  -v /data/ilf:/app/data \
  -v /output/ilf:/app/output \
  ilf-eval-server:latest
```

### With Resource Limits

```bash
docker run -d \
  --name ilf-server \
  --restart unless-stopped \
  --memory="512m" \
  --cpus="1.0" \
  -v ilf-socket:/tmp \
  -v /data/ilf:/app/data \
  -v /output/ilf:/app/output \
  ilf-eval-server:latest
```

### Docker Compose Production

```yaml
services:
  ilf-server:
    image: ilf-eval-server:latest
    restart: always
    mem_limit: 512m
    cpus: 1.0
    volumes:
      - ilf-socket:/tmp
      - /data/ilf:/app/data
      - /output/ilf:/app/output
    logging:
      driver: "json-file"
      options:
        max-size: "10m"
        max-file: "5"
```

## Kubernetes Deployment

### Deployment YAML

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ilf-eval-server
spec:
  replicas: 1
  selector:
    matchLabels:
      app: ilf-eval-server
  template:
    metadata:
      labels:
        app: ilf-eval-server
    spec:
      containers:
      - name: server
        image: ilf-eval-server:latest
        volumeMounts:
        - name: socket
          mountPath: /tmp
        - name: data
          mountPath: /app/data
        - name: output
          mountPath: /app/output
      volumes:
      - name: socket
        emptyDir: {}
      - name: data
        persistentVolumeClaim:
          claimName: ilf-data-pvc
      - name: output
        persistentVolumeClaim:
          claimName: ilf-output-pvc
```

## Networking

### Host Network (for local testing)

```bash
docker run -d \
  --name ilf-server \
  --network host \
  ilf-eval-server:latest
```

### Bridge Network (default)

The Unix socket is shared via volumes, so no port exposure needed.

## Debugging

### Access Container Shell

```bash
docker exec -it ilf-server /bin/bash
```

### Check Server Process

```bash
docker exec ilf-server ps aux | grep eval_server
```

### Check Socket File

```bash
docker exec ilf-server ls -la /tmp/ilf_eval.sock
```

### Test with Manual Socket Connection

```bash
docker exec -it ilf-server bash
# Inside container:
echo '{"cmd":"ping"}' | nc -U /tmp/ilf_eval.sock
```

## Troubleshooting

### Server won't start

```bash
# Check logs
docker logs ilf-server

# Check if binary exists
docker exec ilf-server ls -la /app/eval_server

# Check dependencies
docker exec ilf-server ldd /app/eval_server
```

### Client can't connect

```bash
# Check if socket exists
docker exec ilf-server ls -la /tmp/ilf_eval.sock

# Check if server is running
docker exec ilf-server ps aux | grep eval_server

# Verify volumes are shared
docker inspect ilf-server | grep -A 10 Mounts
```

### Permission issues

```bash
# Check file permissions
docker exec ilf-server ls -la /app
docker exec ilf-server ls -la /tmp

# Fix ownership (if needed)
docker exec ilf-server chown -R root:root /app
```

## Image Size

```bash
# Check image size
docker images ilf-eval-server

# Typical sizes:
# - Builder stage: ~800MB
# - Runtime stage: ~200MB
```

## Cleanup

```bash
# Remove containers
docker-compose down

# Remove images
docker rmi ilf-eval-server:latest
docker rmi ilf-eval-client:latest

# Remove volumes
docker volume rm ilf-socket

# Full cleanup
docker-compose down -v --rmi all
```

## CI/CD Integration

### GitHub Actions Example

```yaml
name: Build and Push Docker Image

on:
  push:
    branches: [main]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      
      - name: Build image
        run: docker build -t ilf-eval-server:${{ github.sha }} .
      
      - name: Test image
        run: |
          docker run -d --name test-server ilf-eval-server:${{ github.sha }}
          sleep 2
          docker logs test-server
          docker stop test-server
      
      - name: Push to registry
        run: |
          docker tag ilf-eval-server:${{ github.sha }} myregistry/ilf-eval-server:latest
          docker push myregistry/ilf-eval-server:latest
```

## Best Practices

1. **Use multi-stage builds** to reduce image size
2. **Pin base image versions** for reproducibility
3. **Use .dockerignore** to exclude unnecessary files
4. **Run as non-root user** (can be added to Dockerfile)
5. **Use volumes** for persistent data
6. **Implement health checks** for production
7. **Set resource limits** to prevent resource exhaustion
8. **Use logging drivers** for centralized logging

## Security Considerations

1. **Scan images** for vulnerabilities:
   ```bash
   docker scan ilf-eval-server:latest
   ```

2. **Run as non-root** (add to Dockerfile):
   ```dockerfile
   RUN useradd -m ilf
   USER ilf
   ```

3. **Read-only root filesystem**:
   ```bash
   docker run --read-only -v ilf-socket:/tmp ilf-eval-server
   ```

## Summary

The Docker deployment provides:

✅ **Isolated environment** - All dependencies contained  
✅ **Easy deployment** - Single command to start  
✅ **Portability** - Runs anywhere Docker runs  
✅ **Reproducibility** - Same environment every time  
✅ **Scalability** - Easy to replicate for multiple instances  

For production use, combine with orchestration tools like Docker Swarm or Kubernetes for high availability and load balancing.
