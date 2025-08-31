# Dockerfile for Posting - HTTP API client

FROM python:3.11-slim

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy project files
COPY pyproject.toml uv.lock ./
COPY src/ ./src/
COPY README.md LICENSE ./

# Install uv
RUN pip install uv

# Install dependencies and the package
RUN uv sync --no-dev
RUN uv pip install -e .

# Create a non-root user
RUN useradd --create-home --shell /bin/bash posting
USER posting

# Set the entrypoint
ENTRYPOINT ["uv", "run", "posting"]
CMD ["--help"]
