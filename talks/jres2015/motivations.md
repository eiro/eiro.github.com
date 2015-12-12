% Vim, la console d'administration qui vous manquait

# Pourquoi?

votre SI est une somme d'outils qui n'ont jamais été pensés pour interagir
ensemble et même si vous avez mis en place une tétrachiée de connecteurs,
batches de synchro et autres connecteurs, il vous manque de quoi administrer 
le tout en construisant une console d'administration qui permette la
consultation et la mise a jours de données dans des systèmes parfois très
différents (ldap, sql, fichiers plats). la gestion de votre production 
(maintenance préventive et corrective, assistance, gestion des incidents,...).

pour résoudre le problème, il vous faut des outils qui permettent une vue
consistente. il vous faut convaincre vos décideurs, planifier et implémenter
une des solutions suivantes:

* soit la mise en place d'un outils "générique", avec 
  * longue prise en main
  * adaptation "accrobatiques" au SI
  * risque de penser le SI pour l'outils et non l'inverse

* soit un développement local
  * difficile à cadrer
  * long a développer
  * pénible à maintenir

quoi qu'il en soit: les mois vont passer avant que vous ne disposiez d'un de
ces outils. en permettant de 
vim peut alors devenir une solution temporaire (voir alternative).

### Approche graphique

ces outils graphiques (bien souvent web) sont des développements locaux (très
adaptés mais couteux à maintenir) ou de l'adaptation (via extensions,
configuration, détournement et parfois modification du code) de logiciels issus
de l'écosystème open-source.

En partant du principe qu'un soin suffisant y est apporté, ces outils ont
l'avantage de permettre à des personnels peu techniques de réaliser *rapidement*
des taches tout en assurant une robustesse offerte par le cadre applicatif.

Ce même cadre fait malheureusement preuve de rigidité et des taches à peine
plus complexes sont impossibles sauf a mobiliser des ressources de
développement dans des délais qui rendent le besoin caduc. 

### le scripting

    "At its heart is the idea that the power of a system comes more from the
    relationships among programs than from the programs themselves"
            -- Rob Pike

Se débarasser de ces cadres applicatifs et exposer de manière simple et
puissante les outils qui tirent directement partie des differentes expositions
du SI en utilisant les outils d'administration, APIs (remote ou non), outils
d'administration des différents éléments permettent de donner acces aux taches
courantes sous la forme de scripts.

même accompagnés par des conventions fortes et une documentation claire,
l'utilisation de ces scripts ne permettent pas de rivaliser avec la productivité 
et la robustesse des applications graphiques pour tous les cas prévus par ces
dernières (sauf modifications par lots). 

# vim pour tirer le meilleur parti des deux approches

## Anatomie d'une GUI

les GUIs de gestion sont un ensemble fini de vues interactives telles que 

* ces vues sont majoritairement
    * des tableaux de bord
    * des rendus de collections d'objets du SI
      (avec la possibilité de filtrer et requêter)
    * des rendus détaillés d'objets du SI

* ces interactions sont majoritairement
    * la navigation entre les vues
    * la commande de CRUD sur les objects et les collections

## reproduire ces élements sous vim

### communication

le verbe '!' de vi permet de

* écrire la sortie d'un pipe dans un buffer
* lire tout ou partie d'un buffer pour alimenter un pipe
* filtrer tout ou partie d'un buffer avec un pipe

toutes les commandes du SI peuvent donc

* alimenter et modifier le contenu d'un buffer (une vue)
* utiliser le contenu d'un buffer pour paramètrer une action

les mappings permettent d'associer des touches à des actions. 

# WIP

=== GARBAGE ....

== FR

Le temps est à la fois ce qui nous manque pour mettre en place des outils
adaptés à la gestion de nos SI et ce que nous perdons à ne pas en disposer.

Faute de mieux, j'ai commencé à utiliser vim comme glue interactive entre des
scripts incomplets et des procédures mal cernées. La capacité de lire et écrire
dans les pipes et la facilité avec laquelle il est possible de configurer une
nouvelle interaction permettent d'appréhender vim comme un squelette applicatif
respectant le principe MVC:

* M: les scripts d'exploitation
* V: les buffers sont une représentation textuelle de collections ou d'objets
* C: les interactions définies pour chaque type de vue et permettant
les opérations courantes (CRUD) et la navigation en profondeur des
éléments organisationnels (tickets, listes de taches, notes,
documentation ) ou structurels (fichiers de configuration de serveurs,
entrées LDAP, enregistrements applicatifs, journaux d'évenement,
consommation d'API REST ...).

Ce bricolage occasionnel est devenu une pratique quotidienne qui me permet
d'adapter facilement mes outils a mes nouvelles demandes. Ce poster est
l'occasion de décrire la logique et les avantages de cette méthode qui
me permet de disposer d'une configuration générique, modulaire,
extensible au fil des demandes.)))

== EN

We miss time to spare time. this is the tale of all our information systems
as they reach a certain size or level of complexity.

Missing the good tools while deadlines approaches, i started to use vim
as an interactive glue over unfinished scripts in fuzzy workflows and it turns
out to be a very pleasant and productive way to work around the lack of
conventions and tools.

Since then, i took an increasing time of my daily work switching from buffers
to buffers inside my editor, building a complete visual application while using
it. there is no boundary between using and extending my environment using the
MVC method where:

* M are the maintainance scripts (providing CRUD operations)
* V are buffers where texts are rendering collections and objects
  and providing mappings related to the type of rendered things
* C are all the operations defined by the vim keybindings that call
  maintainance scripts with relevant parameters and output filtering.

so clicks on my GUI are replaced by two letters mappings

    ,d to delete
    ,s to show
    ,e to edit
    ,x to execute
    ... 

to do the right things on entries of request trackers, ldap entries, logs,
REST API results, system log chunks and so on.

