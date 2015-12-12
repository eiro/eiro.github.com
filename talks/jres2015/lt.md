---
title: vim comme console d'admin, la démo
author: Marc Chantreux (mc@unistra.fr)
---

# l'idée

* développer des GUI
       * moches
       * fragiles
* en quelques lignes

# parfait pour 

* les solutions temporaires
* les évolutions empiriques (prototypage?)

# la logique (inspirée du acme editor)

* des commandes cli (M)
    * préparées dans des buffers (V)
    * affichées dans des buffers (V)
* (C?) utiliser des filetypes (interactivité, folding,...) 
* laisser vim et l'utilisateur faire le filtrage/nettoyage

# live demo: un gestionnaire de processus

* cas simple (7 lignes)
* pas besoin d'un SI: a faire chez vous
