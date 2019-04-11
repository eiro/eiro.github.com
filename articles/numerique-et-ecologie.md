---
vim: et ts=2 sts=2 sw=2
title: Numérique et écologie
keywords: climat energy suckless ecology pollution
author: Marc Chantreux <marc.chantreux@renater.fr>
---

à force de répondre aux questions ou aux invitations à la réflexion qui me
sont lancés à propos de l'écologie (et probablement dans la perspective de la
préparation de mon article JRES), je commence ici à rédiger un article qui
reflète l'état de ma réflexion sur le sujet.

# pourquoi ca pompe

rappeller les bases de l'infra internet et de l'ordinateur: ce qui consomme,
quand et pourquoi?

# les chiffres

=> shift + ecoinfo

# infra internet ideale

  * proxy -> proxy -> on demand
  * binary proto, txt  et minification
  => changer toute la stack :'(

# de la bonne pratique du mail

## webmail ou client lourd

* préférer client lourd sur tout terminal avec consultation régulière
* n'activer que la synchro des indexes et on demande sur consultation sporadique
* webmail pour consultation occasionnelle/unique

## pratiques de rédaction

* le tofu c'est mal (virer les parties inutiles)
* texte pur
* partage ecologique de documents (binaires?)

  => nécessité d'outils encourageant les bonnes pratiques par l'ergonomie
  => démontrer le toolchain geek pour s'en inspirer

# de la bonne utilisation du web

* apprendre a utiliser les urls, les signets, les bookmarks, les caches
  (https://www.blog-libre.org/2018/01/13/mieux-utiliser-la-barre-dadresse-de-firefox/)

# télécharger/cloud

* préférer les modes offline!
* n'utiliser le cloud que comme archivage/backup
* backups locales pour les fichiers édités régulièrement

* supports physiques
    * télécharger des échantillonages adaptés aux périphériques de lecture
      (lower is better, 4k sans interet sur du 107')
    pret /échange >>> achat
    => médiathèques
    ?? promotion des petits videastes (youtubers,...)
* préférer l'échange de fichiers par clefs/disques USB
  (ou ethernet/bluetooth pair a pair)
  les systemes de broadcasting (tv, tnt)
* si réseau: (proxy .. nntp ) > P2P > téléchargement >> streaming (sauf one shot)
* réseau local: proxy http

# écoconception web

## design

### sensibilisation

  * démontrer démontrer le ratio gain ergo/poids
  * démontrer l'inspecteur réseau
  * expliquer les problemes de volumes
  * expliquer OSI: couche présentation (http ...)
  * démontrer un cas idéal futur (cbor?)
    et expliquer (allocation prédictive, parsing, poids...)

###

  * sites statiques: securité + perfs
  * utilisation d'un langage de preprocess
    (minifier+validation structure). exemple: pug+stylus
  * permettre l'édition collaborative (git+markdown+..)
  * indexations full text (maps md?)
  * hardcore: textes purs (facon rfc). quid accéssibilité ?

## infra

  * le plus pret possible (réseaux urbains)
  * paramètrage (etags, compression à la volée,...)

# production de contenu

  * edition != échange != consultation (besoins différents)
    => un format pour chaque
    * démontrer les formats low tech
  * découplage des informations => encapsulation vs liens faibles
    (aka tar vs odt)
  * production de gros volumes
  * démontrer consommation mémoire suites bureautiques (pire: naviguateur web)

# historique

* commercialisation => recherche modeles commerciaux => tracking, privation, ...
* réduction des couts
  * faire vite et sale
  * réduire les services a l'usager (isps)
  * réduire le support
* problèmes d'étérogénéité et de déployement: web everywhere (java avant)
* le problème de l'interpretation et des bytecode
* un équilibre a trouver: one shot => temps de rédaction!
* réseaux deconnectés et PJ

# vision hardcore/résiliente (juste pour se faire peur?)

et si tout foirait?

* les terminaux texte
* les vm légers
* les binary protocols

étrangement pas si invalidant que ca pour pas mal d'usages!

# bouts de trucs écrits à des gens

parler de l'organisation de la fuite des gafams, de la
généralisation du p2p pour le streaming, de l'arret de l'usage des
protocoles routés pour les biens de consommation culturelles courantes
(donc de la capacité d'enregistrer les programmes diffusés par la TNT,
retourner dans les mediathèques et meme s'y échanger des contenus),
de rendre la possession et la diffusion de copies légales et
d'encourager la copie par des systemes de proximité basse conso
(wireless ou non), developper ces protocoles pour eviter que les paquets
ne fassent le tour du monde, démocratiser cet usage, arreter de livrer
des contenus multimedia full HD pour les écouter avec des intra
oriculaires et le visionner sur du format timbre poste, de forcer les
isps a récuciter des services de proximisation des flux (nntp?)
...
....
....
mais pour ca il faut que les users s'engagent dans une démarche
citoyenne dans leurs votes, leurs achats, leurs pratiques...

# Byte me

Le projet

* produire des matériels pédagogiques pour la sensibilisation
  aux problèmes et aux solutions
* préparer des cours d'autodéfense au greenwashing numérique qui a déjà
  commencé (faire passer pour vert ce qui est en fait juste a peine
  moins polluant qu'avant)
* animer des ateliers pratiques exploitant ces matériels
* structurer une offre de services régionale pour l'assistance à la
  longévité des terminaux (a priori emmaus fait déjà?), la production
  et l'hébergement de services locaux et low cost (au sens énergétique,
  j'entends)
* interagir avec les communautés du logiciel libre pour travailler
  sur des plateformes et outils écologiques. Favoriser les échanges
  entre les développeurs et utilisateurs.
* lancer des réflexions sur nos moyens en temps que consommateurs pour
  accompagner les changements comportementaux, sociaux et économiques
  pour faciliter la transition des comportements numériques (fair
  hardware, accès à l'administration système des terminaux,
  la réorganisation de l'accès aux biens culturels numériques, enseignement
  ...) et transformer cette réflexion en propositions/actions concrètes.
* pour tout ou partie des objectifs: identifier les synergies possibles
  avec les acteurs locaux, nationaux, internationaux

