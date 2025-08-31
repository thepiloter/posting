# Docker Usage for Posting

This directory contains Docker configuration for running Posting in a containerized environment.

## Quick Start

### Using Docker Compose (Recommended)

1. Build and run the container:
```bash
docker-compose up --build
```

2. The container will start Posting with the sample collection.

### Using Docker directly

1. Build the image:
```bash
docker build -t posting .
```

2. Run the container:
```bash
docker run -it --rm posting
```

3. Run with a custom collection:
```bash
docker run -it --rm -v $(pwd)/sample-collections:/home/posting/collections posting --collection /home/posting/collections
```

## Features

- ✅ Self-contained environment with all dependencies
- ✅ Non-root user for security
- ✅ Persistent volumes for configuration and data
- ✅ Sample collection included
- ✅ Environment variable support
- ✅ TUI support with proper terminal handling

## Sample Collections

The `sample-collections` directory contains example HTTP requests:
- `get-example.yaml` - Simple GET request to httpbin.org
- `post-example.yaml` - POST request with JSON body
- `.env` - Environment variables for requests

## Notes

- The TUI interface works in the Docker container with proper terminal support
- Configuration and collections are persisted using Docker volumes
- No external API keys or services required for basic functionality
