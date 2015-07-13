% notes relatives a jres 

- devel rapide
  - iterations courtes lors de productions de livrables
  - integration directe dans un toolkit + large 
- 0 infra 
  - 0 serveur, 0 service, 0 deploy, 0 monitor
  - Securité: ma clef, ma conf
    -> pas de delegation a configurer 
    -> tracabilité
- pas de comportement par defaut:
  - share & configure
  - intégrer et etendre dans ses habitudes 
- Prototypage interface web 
  - parcours en profondeur
    * vue d'ensemble ()
      -> collections (incidents, tickets, elements de SI, ...)  
      -> instances ou classes (configuration)
  - parametrer, experimenter, jeter (agilité)
- plus secure et simple que la CLI

# begin

Le temps est à la fois ce qui nous manque pour mettre en place des outils
adaptés à la gestion de nos SI et ce que nous perdons à ne pas en disposer.

Faute de mieux, j'ai commencé à utiliser vim comme glue interactive entre des
scripts incomplets et des procédures mal cernées. La capacité de lire et écrire
dans les pipes et la facilité avec laquelle il est possible de configurer une
nouvelle interaction permettent d'appréhender vim comme un squelette applicatif
respectant le principe MVC:

* M: les scripts d'exploitation
* V: les buffers sont une représentation textuelle de collections ou d'objet
* C: les interactions définies pour chaque type de vue et permettant
  les opérations courantes (CRUD) et la navigation en profondeur
  en profondeur des éléments organisationnels (tickets, listes
  de taches) ou structurels (fichiers de configuration de serveurs, entrées
  LDAP, enregistrements applicatifs, journaux d'évenement, consommation d'API
  REST ...).

Ce bricolage occasionnel est devenu une pratique quotidienne qui me permet
d'adapter facilement mes outils a mes nouvelles demandes. Ce poster est
l'occasion de décrire la méthode qui me permet de disposer d'une
configuration générique, modulaire, extensible au fil des demandes.


# end


à utiliser vim pour
organiser des tickets en provenance du bugtracker et notre service,
utiliser leur contenu pour paramètrer des actions correctives et rendre compte
aux usagers en utilisant des gabarits de réponses que je personnalise avant
envoi. Par la suite, j'ai ajouté la possiblités interactives de CRUD sur des
éléments du SI: annuaire LDAP, wiki, bases de données applicatives (dont
l'accès nécessite des rebonds via ssh), consommation d'API REST: les
fonctionnalités sont simples a implémenter (puisqu 
l'environement que j'utilise pour )

Les nombreux avantages de ce bricolage ponctuel en ont fait un outils quotidien
de productivité et rien ne me manque qu'un outils graphique plus complexe ne
pourrait me fournir: interactions, intégration, contenus dynamiques,

Il me permet de produire des contenus éditables et interactifs qui 
intègrent des rapports de métrologie et d'incidents, de la documentation interactive, 
une interface d'interrogation et de CRUD des élements du SI, le tout organisé
autour d'un parcours en profondeurs mis à jour dynamiquement. 

- de produire une documentation interactive ()



qui était initialement bricolage ponctuel s'est vite imposé comme un outils extr

devenu un outils indispensable: le fait de manipuler  






au quotidien pour mon organisation, la réalisation des taches
courantes, la documentation de site.

Le présent poster propose une méthodologie qui vous permet d'étendre votre
trousse à outils lors de la production de livrables en paramêtrant vim 
pour permettre

* un parcours en profondeur des concepts organisationnels et fonctionnels 
  (listes de taches, élements du SI, documentation, gabarits, ...)
* la génération de contenus interactifs, éditables, manipulables.


- incorporant de nouvelles fonctionnalités lors de la production de livrables
- 
- 0 infra 
  - 0 serveur, 0 service, 0 deploy, 0 monitor
  - Securité: ma clef, ma conf
    -> pas de delegation a configurer 
    -> tracabilité
- pas de comportement par defaut:
  - share & configure
  - intégrer et etendre dans ses habitudes 
- Prototypage interface web 
  - parcours en profondeur
    * vue d'ensemble ()
      -> collections (incidents, tickets, elements de SI, ...)  
      -> instances ou classes (configuration)
  - parametrer, experimenter, jeter (agilité)
- plus secure et simple que la CLI




ponctuelle au départ s'est rapidement imposée pour à moi comme un
outils présentant de nombreux avantages qui font que j'organise aujourd'hui mon 

quotidien autour de 
du temps une serie de rapports, affichage interactif 

le présent poster a pour but de partager les bonnes pratiques de rédaction et
maintenance de cette console.

# notes



# vim, la console d'administation qui vous manquait

Contraints par le temps, les cultures de sites, la taille et le caractère
mouvant de nos systèmes d'informations, nous peinons à développer et maintenir
des interfaces simples et cohérentes nous permettant de débarasser nos
quotidiens de taches chronophages, répétitives ou complexes (y compris en
partant de solutions "clef en main" qu'on passe son temps a adapter à la
réalité de nos environements).

Nos trousses à outils se réduisent bien souvent à quelques scripts, de bonnes
habitudes qui s'appuient sur des logiciels génériques (accompagnée d'une
documentation interactive à jour dans les meilleur des cas) et l'esperance de
ne pas retomber dans les embuches courantes. Le temps est à la fois ce qui nous
manque pour disposer d'interface plus construite et ce que nous perdons à ne
pas en disposer.

Faute de mieux (et m'inspirant de diverses lectures et de fonctionnalités vues
dans d'autres outils), J'ai commencé à utiliser vim pour organiser des tickets
en provenance du bugtracker et notre composante et utiliser leur contenu pour
paramètrer des actions correctives. S'en suivirent des interactions avec le
wiki, la génération de réponses types personnalisées interactivement avant
l'envoi, la consultation et l'édition du wiki, de l'annuaire d'établissement
(LDAP) et de bases de données applicatives dont j'ai la charge. Plus récement,
l'utilisation de spécifications SPORE me permet la consommation d'API REST de notre
SI.

Cette solution temporaire 

l'interrogation du wiki, la consultation de
l'annuaire d'établissement (LDAP) de réponses types en l'envoi de messages k
façon minimaliste le bugtracker et le wiki de ma composante, 

rapides entre le conte

pour visualiser les contenus  
des demandes issus du bugtracker de notre service et interagir avec des scripts
correctifs en utilisant directement 
pour donner un cadre visuel


à des paramètres de  

En utilisant vim comme point d'entrée sur notre SI (et en adoptant la méthode
que je propose dans ce poster), chaque tache réalisée est l'occasion de laisser
des tuteurs facilitant une prochaine itération. Petit à petit, vous construisez
simplement des documentations ou des vues du SI qui soient interactives, simples 
et dynamiques.

Pour ma part, vim me permet d'échanger des informations entre ma messagerie, ma
liste des taches, le bug tracker et le wiki du service, les differents outils
d'administration et bases de données (relationnelles, ldap, flat files, REST
APIs ...), des dépots git ... Rien n'est parfait mais mon niveau de
satisfaction dépasse de loin toutes les autres approches que j'ai experimenté
au cours de ma carrière.
