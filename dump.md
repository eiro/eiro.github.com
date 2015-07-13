% Dump ideas … as it comes

# Why isn't perl so popular

* lot of trolls outthere
  * unfair compares based on a lost unix culture
  * syntaxes are awesome but unreadable
  * we grown up with those, the youth grown up with windows
* hello_world.py celebration vs Perl Masons
* our ecosystem is stong and lack of entry points
* Ironman: more echo chamber! PerlWeekly: not distributed

## CPAN 

* un outils indispensable parceque nous savons
  * ce qu'est CPAN
  * comment s'en servir
* pas de leadership
* experimentation
* personnelle 
* pour la communauté
* les autres communautés nous imitent sans nous égaler 
  (ruby et haskell pas trop loin derriere) 

CPAN pour les autres: hell 

* liberté         -> trop de choix
* experimentation -> trop de "merde" 

CPAN GTD vs BNP (Brand new projects)

* Modules + concision = GTD
* pourquoi publier des scripts de 5 lignes ? 
* autres technos = boulot plus gros = *new project* (Champain!) 

Culture du "out of the box" manquante 

* exemples? 
  * DBIx::Class -> phpMysqlAdmin ?
  * Net::LDAP   -> gosa ?
* pourquoi ? 
* degres de liberté (trop faible)
* niveau de techninicté (sous-estimé)    

fix ? 

* more annoncement
* more App::* 
* more project pages

## de l'enseignement de l'informatique 

* de l'inertie intellectuelle et des religions
  * les fichiers (punchcards -> meta)
  * le clavier azerty
  * python for kids
  * scientists -> ingenieurs -> intégrateurs
  * bases de logique != CPU instructions
  * It all went wrong at Xerox PARC
  * "over shoulder" effect
    * de la tache a accomplir 
    * des contraintes environementales (portabilité unices) 
    * cookbooks vs stong bases
  * intellectuellement, l'inertie est nécessaire, la résistance est dangeureuse 
  * Computers for Cynics - Ted Nelson comme introduction

* programmation fonctionnelle 
  * excel, le langage fonctionnel le plus utilisé au monde
  * unix shell (stateless et monadic)
  * no more Moore

# links and stuff

## on training

* [http://rubular.com/](rubular) nice for training

## on web dev

* [list of js game engines](https://github.com/bebraw/jswiki/wiki/Game-Engines)
* [nice form labels demo](http://viget.com/inspire/making-infield-form-labels-suck-less-2#jsfiddle)

### go to D3

[D3](http://d3js.org/) js data-driven documents and
[C2](http://keminglabs.com/c2/) clojurescript counterpart are awesome.
[tutorials there](https://github.com/mbostock/d3/wiki/Tutorials).

sooo... needs of [kineticjs](http://kineticjs.com/) anyone ? 

# Screencasts

## découpage de fichiers `.ts` avec `dd`

soit

* `source.ts` le fichier enregistrement
* `target.ts` la sous-partie de `source.ts` a isoler
* `n` la taille en `bs` (ici 4Mo) de toutes les sous-parties précédentes
* `m` la taille de la présente sous-partie

la commande 

    dd if=source.ts of=target.ts bs=4M skip=n count=m

produit le nouveau ts.

le resultat d'un encodage video n'étant pas linéaire en taille, il faut découper
par un découpage empirique (générer des vignettes avec vlc aiderait pe). 
On peut jouer sur la taille du bs pour avoir plus ou moins de précision.
