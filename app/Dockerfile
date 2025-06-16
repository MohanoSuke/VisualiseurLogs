FROM node:18

# Créer un dossier pour l'application
WORKDIR /app

# Copier les fichiers
COPY server.js ./
COPY public ./public

# Installer express (et éventuellement ws ou autre lib)
RUN npm init -y && npm install express

# Expose le port pour le serveur
EXPOSE 7000

CMD ["node", "server.js"]
