# Use a imagem oficial do n8n como base
FROM n8nio/n8n:latest

# Instale o pacote waha usando o usuário root temporariamente
# para garantir que as permissões não causem problemas mais tarde
# A flag --unsafe-perm permite a instalação com o usuário root,
# garantindo compatibilidade com o ambiente do container
USER root

# Copie os arquivos de workflow e de inicialização
COPY workflows/whats.json /home/node/.n8n/whats.json
COPY docker/entrypoint.sh /home/node/entrypoint.sh

# Certifique-se de que os arquivos copiados têm as permissões corretas
RUN chown -R node:node /home/node/.n8n /home/node/entrypoint.sh
RUN chmod +x /home/node/entrypoint.sh

USER node

# Defina o comando de entrada
ENTRYPOINT ["sh", "/home/node/entrypoint.sh"]
