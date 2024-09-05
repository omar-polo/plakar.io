---
title: "Perspectives de développement de plakar"
date: 2019-08-25 04:00:00
author: Gilles Chehade
authors:
 - "gilles"
categories:
 - technology
tags:
 - plakar
 - backups
---

Depuis 1999, je gère mes propres serveurs et, au fil des ans, j'ai exploré plusieurs solutions de sauvegarde. J’ai expérimenté avec diverses méthodes : de l’utilisation de tar à dump/restore, puis des sauvegardes incrémentielles avec rsync, et finalement, j’ai commencé à développer mes propres outils pour répondre à des besoins spécifiques.

En effectuant un nettoyage de mes anciens dépôts privés, j’ai retrouvé trois projets distincts :

```
drwxr-xr-x   2 gilles  gilles   512 Aug  3  2012 backup
drwxr-xr-x   2 gilles  gilles   512 Jul 23  2012 backuptool
drwxr-xr-x   6 gilles  gilles   512 Apr  1  2015 plakar
```

Les répertoires backup et backuptool seront bientôt supprimés. Il s'agissait d’expériences visant à créer un format de sauvegarde unique avec déduplication et versionnage. Cependant, ces projets étaient davantage des prototypes, et je les ai rapidement abandonnés.

En revanche, plakar est bien plus prometteur.


## Présentation de Plakar

Plakar est un utilitaire qui permet de créer un dépôt dans ~/.plakar et de capturer des instantanés (snapshots) de systèmes de fichiers. Chaque fichier est découpé en fragments basés sur son contenu, qui sont ensuite compressés et chiffrés avant d’être stockés dans le dépôt. La technologie de liens physiques (hard links) garantit qu’il est possible de conserver plusieurs instantanés sans coût additionnel en espace de stockage. Le chiffrement permet également de pousser ces sauvegardes vers un serveur distant, une pratique que j’ai adoptée pour garantir la sécurité avec des sauvegardes sur site distant et sur Google Drive.

Certains pourraient se demander si cet outil diffère de solutions comme tarsnap. Bien que tarsnap semble similaire, je ne l’ai pas utilisé, notamment parce qu'il ne prend pas en charge l'auto-hébergement.

Le dépôt contient une version de Plakar écrite en Python, prenant en charge diverses opérations :

push pour sauvegarder un instantané,
pull pour restaurer un instantané,
remove pour supprimer un instantané,
list pour lister les instantanés,
diff pour comparer deux instantanés,
et search pour rechercher des fichiers ou répertoires dans les instantanés.
Plakar permet également de travailler sur des portions d’un instantané, sans nécessiter la restauration complète, ce qui optimise les opérations sur des sous-ensembles de données. J'avais également commencé à développer une interface utilisateur permettant de visualiser les instantanés via un serveur web local sécurisé par mot de passe.

Voici quelques exemples d'utilisation :

```
laptop$ plakar list
laptop$ plakar push ~/wip/OpenSMTPD
snapshot ee30bf0b4a4f44b5bfe71c632424c4d3: dirs=47, files=426, errors=0
laptop$ plakar list
2019-08-25-05:34:01 ee30bf0b4a4f44b5bfe71c632424c4d3 dcnt=47 fcnt=426 size=28.4MB
laptop$ plakar pull ee30
laptop$ ls ee30bf0b4a4f44b5bfe71c632424c4d3/home/gilles/wip/OpenSMTPD/
README     THANKS     regress    smtpd      smtpscript
laptop$ ls /home/gilles/.plakar
chunks    pending   purge     resources snapshots
laptop$ plakar ui

To use UI, go to http://127.0.0.1:8080, and use password: 2f1f1b61350fdfbb

Bottle v0.12.17 server starting up (using WSGIRefServer())...
Listening on http://127.0.0.1:8080/
Hit Ctrl-C to quit.
```

<img src="2019-08-25-plakar_1.png" />
<img src="2019-08-25-plakar_2.png" />
<img src="2019-08-25-plakar_3.png" />
<img src="2019-08-25-plakar_4.png" />


## La transition vers Golang

Bien que je ne prévoie pas de publier la version Python de Plakar en raison de l'absence de maintenance, j'ai décidé de réécrire l'outil en Go pour améliorer mes compétences dans ce langage. Le week-end dernier, j’ai finalisé une version fonctionnelle. Actuellement, les commandes push, pull, list, et trash sont opérationnelles. Je compte l’utiliser sur mes machines pendant quelques semaines avant de publier le code sur GitHub.

Quelques exemples en Go :

```
laptop$ plakar list
laptop$ plakar push ~/wip/OpenSMTPD
2b5bec66-1799-48a1-8418-42509347eac1
laptop$ plakar list
2b5bec66-1799-48a1-8418-42509347eac1 2019-08-25 05:38:58.912591955 +0200 CEST
laptop$ plakar pull 2b5
Restoring directories: 48/48
Restoring files: 426/426
laptop$ plakar trash 2b5
laptop$ plakar list
laptop$
laptop$ ls 2b5bec66-1799-48a1-8418-42509347eac1/home/gilles/wip/OpenSMTPD/
README     THANKS     regress    smtpd      smtpscript
laptop$ ls /home/gilles/.plakar
chunks       objects      purge        snapshots    transactions
laptop$
```

## Prochaines étapes

Je prévois de rédiger plusieurs articles techniques sur les mécanismes internes de Plakar. Certains aspects pourraient intéresser d'autres projets, et je pense qu’ils méritent d’être partagés.
