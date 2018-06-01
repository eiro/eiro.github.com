% My own Perl cookbook

# first steps with Perl

If you are totally newcommers to _PERL 5 (but confortable with programming at
large) those are the steps.

## understand that

* perl is a very strong, well geared community: everything you
  need to learn, write, enjoy _PERL is provided by the _PERLDOC(perlcommunity)
  itself. the official documentation (_PERLDOC) comes with very well written
  references and tutorials (also available on your system, see `man perl`).

* even if _PERL is a very modern dynamic langage,
  [Backward compatibility](https://en.wikipedia.org/wiki/Backward_compatibility)
  is very important to the _PERLDOC(perlcommunity) so try to not learn perl
  reading 20 years old scripts.

## should

* about object oriented programming using _POD4(Moo) and _POD4(Type::Tiny)
* about authoring modules reading _PERLDOC(perlmodstyle)
and using _POD4(Dist::Zilla)
* deploying using _POD4(App::cpanminus), _POD4(Carton), _POD4(Pinto)
* use the _POD4(experimental) _PERLDOC(perlsub,Signatures)

so the sites to know are
* _METACPAN, which is the search engine/social network over _CPAN
* _PERLDOC, the perl documentation site (also available on your machine by
typing `man perl`). Especially _PERLDOC(perlintro)

# Deploying

# Parsing

don't bet on recursive Regexps: as perl isn't

this is not just about pattern matching:
* to parse complex structures
* to return rich nested datastructures like AST in result.

while it isn't hard to write your own parser based on `//nxsmg` (i still do it
for very simple cases)

* I tried and succeeded it by myself using an experiment of mine
  called _PERSEC but there are now awesome _PEG modules outthere, each are
  maintained by well known perl hackers.

# Pegex

_PEGEX (by _INGY) wasn't finished when i testd it (in 2014) but sounds very
promising because of its _ACMEISM(acmeic) nature (the same grammar could be used to
generate emitters in _JS and _PYTHON).

Notes:
* welcoming and available community but reachable only via IRC
* no online archive (i think they must have a mailing list).

## Regexp::Grammars

_POD4(Regexp::Grammars) (by _DCONWAY) overloads `qr{}` to add a _PEG featured syntax
inspired to the Perl6's _P6S05.

* very pleasant to write and debug. [Perl6](http://perl6.org) inspiration is obvious.
* soooo slow! (at least in 2009)

## m//cgx functions

* basic example:
  [s-expr parser](https://github.com/eiro/labo/tree/master/parsing_with_perl/sexpr_parser.pl).
* much more code to write than with Pegex or
  [Regexp::Grammars](https://metacpan.org/pod/Regexp::Grammars)
  but runs much faster.
* not so easy to write but good habits comes fast.
* tried to write a collection of helpers named
  [persec](https://github.com/eiro/p5-persec) but i finally never used it.

you *must* read [CSP](http://en.wikipedia.org/wiki/Communicating_sequential_processes)

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

# comment créer des recommendations ?
# automatiser l'install des recommendations ?
cpanm --reinstall --interactive .
cpanm --look Dezi






