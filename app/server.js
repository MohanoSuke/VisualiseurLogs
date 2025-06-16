const express = require('express');
const fs = require('fs');
const path = require('path');

const app = express();
const PORT = 7000;

// Servir les fichiers statiques
app.use(express.static(path.join(__dirname, 'public')));

// Route pour récupérer les logs
app.get('/logs', (req, res) => {
  const logPath = '/logs/app.log';

  fs.readFile(logPath, 'utf8', (err, data) => {
    if (err) {
      return res.status(500).send("Impossible de lire les logs.");
    }
    res.send(data);
  });
});

app.listen(PORT, () => {
  console.log(`Serveur app en ligne sur http://localhost:${PORT}`);
});
