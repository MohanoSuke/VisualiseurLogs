# 🐳 Visualiseur de Logs Docker en Temps Réel

Projet Docker-Compose permettant de simuler la génération de logs système dans un conteneur et 
de les afficher en direct via une interface web simplifiée.

---

## 🎯 Objectif

Mettre en œuvre :
- Deux conteneurs Docker interconnectés
- Un volume Docker partagé
- Un `Dockerfile` personnalisé pour chaque conteneur
- Un serveur Node.js qui lit les logs et les affiche côté client

---

## 🧱 Architecture

```
┌─────────────┐            Volume Docker partagé            ┌────────────┐
│  logger     │ ───────────────────────────────────────────►│   app      │
│  (bash)     │                                             │  (Node.js) │
└─────────────┘                                             └────┬───────┘
                                                                 │
                                                Port 7000 exposé │
                                                                 |
                                                                 ▼
                                                          Interface Web
```

---

## ⚙️ Conteneurs

### 1. `logger` (générateur de logs)
- Basé sur Alpine Linux
- Exécute un script Bash qui écrit toutes les 1-3 secondes dans `/logs/app.log`
- Messages variés (INFO, AVERTISSEMENT, ERREUR)

### 2. `app` (lecteur/serveur)
- Serveur Node.js avec Express
- Lit le fichier `/logs/app.log` via le volume partagé
- Affiche les logs dans le navigateur (mise à jour automatique via AJAX)
- Interface accessible sur `http://localhost:7000`

---

## 📦 Installation & Exécution

1. **Cloner le projet ou récupérer le .zip**
   ```
   git clone https://github.com/MohanoSuke/VisualiseurLogs.git
   cd VisualiseurLogs
   ```

2. **Lancer les conteneurs**
   ```
   sudo docker compose up --build
   ```

3. **Ouvrir l’interface**
   👉 [http://localhost:7000](http://localhost:7000)

---

## 📁 Structure du projet

```
visualiseur-logs/
├── docker-compose.yml
├── logger/
│   ├── Dockerfile
│   └── logger.sh
├── app/
│   ├── Dockerfile
│   ├── server.js
│   └── public/
│       └── index.html
└── README.md
```

---

## 🔗 Technologies utilisées

- Docker / Docker Compose
- Bash
- Node.js / Express
- HTML + AJAX
- Volume Docker nommé (`logs`)

---

## ✅ Fonctionnalités

- Génération aléatoire de logs
- Volume partagé entre conteneurs
- Affichage temps réel des logs dans le navigateur
- Architecture claire et modulaire

---

## ✍️ Auteur

Projet réalisé par **Mohamed BENTEBOULA** sur Docker-Compose.

---
