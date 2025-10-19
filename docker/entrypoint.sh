#!/bin/sh

WORKFLOW_NAME="whats-bot"
WORKFLOW_FILE="/home/node/.n8n/whats.json"
N8N_DATA_DIR="/home/node/.n8n"

# Espera o volume estar montado
mkdir -p "$N8N_DATA_DIR"
chown -R node:node "$N8N_DATA_DIR"

# Instala o pacote waha se não estiver instalado
npm install --prefix "$N8N_DATA_DIR" n8n-nodes-waha --unsafe-perm
ls -l "$N8N_DATA_DIR/node_modules/"

# Verifica se o workflow já foi importado
if ! grep -q "\"name\": \"$WORKFLOW_NAME\"" "$N8N_DATA_DIR/database.sqlite"; then
  echo "Importando workflow: $WORKFLOW_NAME"
  n8n import:workflow --input="$WORKFLOW_FILE"
else
  echo "Workflow '$WORKFLOW_NAME' já está presente. Pulando importação."
fi

# Inicia o n8n
exec n8n start