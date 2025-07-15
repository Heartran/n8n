# Use Node.js 20 as base image
FROM node:20-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    python3 \
    make \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Install n8n globally
RUN npm install -g n8n@1.33.0

# Set environment variables
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV NODE_ENV=production
ENV WEBHOOK_URL=https://n8n-j03d.onrender.com
ENV N8N_EDITOR_BASE_URL=https://n8n-j03d.onrender.com
ENV N8N_DIAGNOSTICS_ENABLED=false
ENV N8N_RUNNERS_ENABLED=true

# Create app directory
WORKDIR /data

# Expose port 5678
EXPOSE 5678

# Create volume for n8n data
VOLUME ["/root/.n8n"]

# Start n8n
CMD ["n8n", "start"]
