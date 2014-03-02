% Perl

# installation de paquets perl

WARNING (a moins d'une nouveauté?):
ne pas utiliser un client cpan en root pour éviter de placer dans les
répertoires du système des fichiers malaisés à supprimer.

différentes solutions existent

## créer des paquets systeme

* sous debian, voir [ma page sysop](sysop.html).
* sous les rpm-based, on utilisait un truc a biblibre ... je sais plus...
* sous macos, j'avais écris
 [cpan2port](https://trac.macports.org/wiki/howto/cpan2port) qui est tjrs
 utilisé par la communauté macports. toutefois:
 * il semble que [homebrew](http://brew.sh/) soit maintenant plus utilisé.
 * comme macos est un des rares unices qui me sorte vraiment par les yeux,
   je ne sais pas ou tout ca en est.
* sous windows, [Strawberry Perl](http://strawberryperl.com/) et son client
  CPAN ou le perl de [cygwin](http://cygwin.org/).

## installer dans son home

les installations de `cpanm` (un client cpan lite)  sont décrites
[ici](http://search.cpan.org/~miyagawa/App-cpanminus-1.7001/lib/App/cpanminus.pm#INSTALLATION).
Le package debian s'appelle `cpanm`.

# notes pour un tuto perlrun (faire le lien avec awk)

Cet article est mon recueil de bonnes pratiques pour les perl oneliners (qui
font d'ailleurs rarement une ligne). je pars du principe que vous avez des
bases de sed et awk (si ca n'est pas le cas: il est temps).

# les flags

perl -wsE 'say $foo' -- -foo=bar

foo="bar" perl -Menv -wsE 'say $foo'

# Tutoriel pour Eirotic Perl

De la préparation de votre environement de développement jusqu'au déployement
de votre application, Perl vous permet d'effectuer de nombreux choix.

Aucun développeur Perl confirmé ne voudrait perdre cette liberté qui permet de
s'adapter à toutes les situations. A l'inverse, le débutant peut facilement
perdre patience devant la richesse de l'écosystème de Perl.

Ce didacticiel propose une seule voie: celle que je pratique maintenant depuis
des années. Ca n'est peut-être pas la meilleure mais elle est le fruit de mon
experience et utilise ce que je pense être les dernières bonnes pratiques en
vigueur dans le monde Perl.

Les prérequis sont simples:

* avoir un compte utilisateur sur une machine Unix (nul besoin d'en
  posséder les droits d'administration) avec Perl (et de préférence zsh)
  installé.

* avoir des bases de shell unix. je ne reviens pas sur des notions comme les
  variables d'environement, le shebang ou les commandes de base de gestion de
  fichiers.

* connaitre 1 editeur de texte. J'utilise [vim](http://vim.org) pour ma part
  mais il existe des IDEs Perl comme [padre](http://padre.perlide.org/) ou
  [epic](http://www.epic-ide.org/). 

* Avoir les bases de la syntaxe Perl et son ecosystème. le présent document
  propose de bonnes pratiques et n'est en rien une initiation à la syntaxe. 
  Vous devez donc savoir ce qu'est un module, le CPAN, un client CPAN.

# Préparer son environement de développement

Perl (et de manière induite tous les outils de l'écosystème Perl) repose sur
des repertoires 


Perl et la plupart de ses outils repose sur des variables d'environement 


There is more than one way to do it in Perl. It's not only about writting code
but also setting up your developpement environement and deploy apps.


This tutorial use my way from zero (well, 

I have the same habits for many years now and I think it would help to share
those to have a from zero to deployement tu

This
tutorial is about my way 


this is a from-zero to Eirotic tutorial.

## setup your working environment

install the cpanm client to ease installation of CPAN dependencies. everything
would work from your home directory, no root 

	curl -L http://cpanmin.us | perl - App::cpanminus

it install `local::lib` 







