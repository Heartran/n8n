# Usa l'immagine ufficiale di n8n con Node.js 18
FROM node:18-slim

# Installa le dipendenze di sistema
RUN apt-get update && apt-get install -y \
    build-essential \
    python3 \
    g++ \
    make \
    && rm -rf /var/lib/apt/lists/*

# Installa n8n globalmente
RUN npm install n8n -g

# Crea la directory di lavoro
WORKDIR /data

# Imposta le variabili d'ambiente
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV NODE_ENV=production
ENV WEBHOOK_URL=https://n8n-j03d.onrender.com
ENV N8N_EDITOR_BASE_URL=https://n8n-j03d.onrender.com
ENV N8N_DIAGNOSTICS_ENABLED=false

# Esponi la porta 5678 (quella usata da n8n)
EXPOSE 5678

# Avvia n8n
CMD ["n8n", "start"]
