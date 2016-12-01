% mes notes de sysops

# security

* is [lynis](https://github.com/CISOfy/lynis) worth to test ? 

ces notes sont globalement toutes valides et testées sous ubuntu.

# debian

## my own dwm package

    mkdir /tmp/dwm
    cd /tmp/dwm
    apt-get source dwm
    vim d*/config.def.h # the modifier for the windows key is 4
    dpkg-source --commit # create a patch file
    dch -i # edit the changelog: your debian version (-mc1 for me)
    dpkg-buildpackage -us -uc
    sudo dpkg -i ../*deb

## packager

### une lib perl

visiblement `dh-make-perl` cherche si le paquet existe avant de le construire

* `corelist` pour savoir si le module est fourni avec la distro perl standard
* `aptitude search` pour savoir si le module n'est pas deja packagé (la
  communauté perl est forte dans le monde debian)

WARNING: assurez-vous que toutes les variables d'environement en `$PERL*` soit
virées avant d'utiliser les commandes suivantes

    dh-make-perl --build . 
    dh-make-perl --build --cpan Perlude

notez que:

* la création des paquets n'est pas récursive 
* si la création d'un paquet plante, allez dans le sous-répertoire de build et
  lancez `make test` pour tenter de comprendre l'erreur.

### une liste de dépendances 

    equivs-control unistra-sympa-perldeps
    $EDITOR control 
    equivs-build

### modifier violement un package existant

interogation: comment ne pas rentrer en conflit avec le paquet offciel?
pinning? prefixage du nom du paquet avec le nom de l'organisation? (genre sympa
devient unistra-sympa?)

### depot du pauvre

## questionnement

aptitude me semble bien plus agréable:

* note conscienscieusement ce qu'il fait. du coup:
  * les paquets proposés a la purge lors de l'appel de la subcommand ne sont pas délirants.
  * `aptitude why`, que c'est bon …
* les motifs de recherche sont clairement poussés, aptitude search ou show
  permettent donc de chercher
  * paquets installés dont le nom commence par perl ou finit par python: `~i (~n perl$ | ~n ^python )`
  * les paquets qui pourraient servir d'alternative au mta actuel: '~Dprovides:mail-transport-agent !~i'
  * …

pourtant il semble que debian fasse machine arrière: pourquoi ?

## configurer automatiquement

* `debconf-utils` produit debconf-get-selections

## todo


# guix et guix-sd

