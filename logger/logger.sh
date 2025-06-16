#!/bin/bash

LOGFILE="/logs/app.log"
mkdir -p /logs
touch "$LOGFILE"

while true; do
    # Choix simple du niveau
    rand_level=$((RANDOM % 3))
    if [ "$rand_level" -eq 0 ]; then
        level="INFO"
    elif [ "$rand_level" -eq 1 ]; then
        level="AVERTISSEMENT"
    else
        level="ERREUR"
    fi

    # Choix simple du message
    rand_msg=$((RANDOM % 10))
    case $rand_msg in
        0) msg="Connexion utilisateur réussie" ;;
        1) msg="Connexion à la base de données établie" ;;
        2) msg="Fichier introuvable" ;;
        3) msg="Jeton JSON inattendu" ;;
        4) msg="Échec du cache, nouvelle tentative" ;;
        5) msg="Déconnexion du serveur" ;;
        6) msg="Espace disque faible" ;;
        7) msg="Tentative d'accès non autorisée" ;;
        8) msg="Sauvegarde terminée" ;;
        9) msg="Délai d’attente de l’appel API dépassé" ;;
    esac

    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $level - $msg" >> "$LOGFILE"
    sleep $((RANDOM % 3 + 1))
done
