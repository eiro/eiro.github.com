% Sympa Hackathon 1

Le premier "Sympa Hackathon" a eu lieu les 4 et 5 novembre à l'antenne
parisienne de [l'INRIA](http://www.inria.fr). Le présent compte-rendu est une
compilation des idées dont j'ai pris note pendant et après l'évenement.
Certaines de ces notes correspondent à des réflexions personnelles qui n'ont 
pas été livrées lors des réunions.

Ont participé 

    * David Verdin et Etienne Méléard (RENATER)
    * Guillaume Rousse (INRIA)
    * Marc Chantreux (Université de Strasbourg)

# Retour sur les usages et évolution de sympa

## les nouveaux usages de sympa (groupware)

Nous avons évoqué la vie des instances que nous gérons (à Strasbourg: presque 9400
listes réparties dans 17 robots) et observons unanimement des changements dans
les usages et les attentes des utilisateurs relatives à sympa.

En effet, les usagers commandent aux listmasters des configurations avancées et
font usage des outils périphériques à la liste de diffusion (les archives, les
documents partagés, pages de réponses, circuit de modération, ...) et
organisent de véritables groupes de travail autour des outils proposés malgré
la relative austérité de l'interface.

La version prochaine de sympa (6.2) sera l'occasion de fournir une nouvelle
interface plus aggréable: ca n'est qu'un début.

## L'intégration dans les systèmes d'information

L'intégration dans les systèmes d'information ne se fait plus uniquement dans
le sens de la consommation: sympa permet aux utilisateurs de produire de
l'information valorisable dans tous le système (A Strasbourg, il est couplé
avec Sogo et permet d'alimenter des groupes dans notre annuaire).

# Sympa 7

## Techniquement

### Pour les développeurs

Afin d'accélérer le développement de Sympa, il était nécessaire de rendre la
base de code plus simple à comprendre et à faire évoluer. Ainsi, la
réorganisation complète du code (travail de longue date de Guillaume Rousse)
s'accompagne d'une large batterie de tests unitaires afin de détecter plus
facilement les éventuels bugs et régréssions que les développements futurs
pourraient introduire.

* Un refactoring complet sur lequel Guillaume Rousse travaille de longue date.
  L'idée n'est pas seulement de nettoyer et réorganiser le code: Guillaume
  introduit aussi des pratiques de développement qui manquaient généralement
  pour permettre aux développeurs de travailler plus confortablement et rapidement
  sans introduire de régréssions ou de bugs. Cette version se vera accompagnée
  d'une large batterie de tests unitaires.
* Nous rendrons le fonctionnement interne de Sympa plus strict, il est acté
  que les fonctions qui n'aboutissent pas provoqueront un `die` plutot que de
  renvoyer `undef`.
* Nous passsons sous git (toujours hebergé sur
  [sourcesup](https://sourcesup.renater.fr/projects/sympa-ng/)), ce qui permettera
  de simplifier les experimentations et les contributions externes (je compte créer
  un repo sur [github](http://github.com/) qui est utilisé par de nombreux
  développeurs Perl).
* Nous experimentons l'introduction de modules CPAN afin de profiter du
  dynamisme de la communauté et nous défaire de la maintenance de code
  spécifique à sympa. Ainsi, [plack](https://metacpan.org/pod/Plack) replacera
  le code FastCGI maison. J'ai aussi suggéré l'utilisation de
  [Moo](https://metacpan.org/pod/Moo) puisque ce dernier est conforme aux
  décisions prises pour le passage d'arguments des methodes.
* Concernant les dépendances que nous allons ajouter, Guillaume insiste sur
  un point: pas de XS qui qu'il en coute (afin de s'assurer que les
  déploiements de sympa restent simples et sans problème).
* Je note a posteriori que nous n'avons pas parlé de la version minimale de
  Perl sur laquelle Sympa doit tourner. J'aurais tendance à pousser le curseur
  vers le haut (beaucoup de distributions récentes fournissent 5.18) mais de
  nombreux administrateurs de la communauté semblent bloqués par les Perl
  standards fournis par des versions assez anciennes de RHEL (que c'est
  triste!).

### Pour les administrateurs

le wizzard va disparaitre au profit

Nous allons simplifier l'installation en remplacant le wizzard

* un module Perl `Sympa::Task` qui sera disponible sur le CPAN. Pour
  peu que le client CPAN soit correctement installé sur la machine cible,
  l'intégralité des dépendances de sympa s'installera par la saisie d'une
  seule commande standard (laissant au passage à l'adminitrateur le choix
  de l'utilisation de `local::lib`).
* un sample de `sympa.conf` largement documenté qui pourra servir de base 
  à la configuration. 

## Fonctionnellement

Le terme Robot (qui était mal choisi de toute façon), doit lui aussi
disparaitre mais nous n'avons là rien de tranché. quelques propositions faites
par des collègues de l'université:

    Communauté, Tribu, Domaine 
    Community , Tribe, Realm 

Votre avis nous intéresse: n'hésitez pas à réagir sur les listes de diffusion
[sympa-users](https://listes.renater.fr/sympa/info/sympa-users), 
[sympa-fr](https://listes.renater.fr/sympa/info/sympa-fr) ou en commentant ce
post.

# Travail commencé durant le Workshop

David et Guillaume ont travaillé sur le refactoring pendant qu'Etienne et moi
nous chargions de: 

* rendre sympa7 installable en l'état (afin d'avoir une version utilisable en
  pour test le plus rapidement possible)
* installer et tester l'UI développé par l'université de Massey (Nouvelle-Zelande)
* discutions autour d'un système de hooks ou de middleware pour la gestion des
  différents evenements de Sympa. L'idée est de permettre aux développeurs Perl
  de pouvoir développer des fonctionnalités sour la forme de modules. Etienne
  penche pour une approche de Hooks à la Drupal. Pour ma part, un cycle de vie
  aller-retour me semble plus pertinente et répandue
  (Plack et ses middleware, DOM Level 2 et le bubbling/capturing, la stack PAM, ...).
  La discution est restée ouverte. Quoi qu'il en soit: 
  l'enrichissement des scenarii (déjà utilisé partout dans sympa) permetterait de
  dépasser de nombreuses restrictions actuelles.

# Liste de mes attentes en vrac

(discutées ou non lors du workshop, plus ou moins catégorisée par priorité)

* Améliorer la convivialité de l'interface et prioritairement 
  * donner un aspect webforum aux archives et à la page de publication
    (toutes les fonctionnalités existent déjà dans l'interface actuelle)
  * permettre du drag and drop dans le depot de document partagé
  * simplifier la page d'administration de la liste (ajouter plusieurs
    modérateurs est par exemple une action tres malaisée pour le moment)
* permettre facilement de mettre un répondeur en place depuis l'interface
* Si possible, permettre aux utilisateurs de conserver l'ancienne interface
  (pour les utilisateurs les plus réticents au changement)
* exposer les fonctionnalités de Sympa via une API REST
  et une spécification SPORE
* utilisation de sympa pour alimenter des ACL de wiki, des groupes seafile,
  des conférences Jitsi
* documentation: fournir un guide pour chacune des audiences que sont 
  les développeurs, les administrateurs système, les listmasters et les usagers

# Notes pour plus tard

* expliquer le (VERP: Variable Enveloppe Return Path)
* expliquer le tracking: 
    * récuperer les accusés de réception
    * récuperer les mail delivery notification
    * utilisation des MDN (mail delivery notification) quand serveur accepte

