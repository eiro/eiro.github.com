% sysop

# liens

## sécurité

## test

* [lynis](https://github.com/CISOfy/lynis)

# debian

## packaging

## modifier un paquet existant


    mkdir /tmp/dwm
    cd /tmp/dwm
    apt-get source dwm
    vim d*/config.def.h # the modifier for the windows key is 4
    dpkg-source --commit # reate a patch file
    dch -i # edit the changelog: your debian version (-mc1 for me)
    dpkg-buildpackage -us -uc
    sudo dpkg -i ../*deb

## depot local a 2 balles

    echo file:///srv/paquets ./ > /etc/apt/sources.list.d/local.sources.list

    cd /srv/paquets
    dpkg-scanpackages . | gzip -c9 > Packages.gz
    aptitude update

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

## pourquoi aptitude et pas apt ?

déjà parceque les motifs! exemples de motifs qui m'ont deja servi

`~Dprovides:mail-transport-agent !~i` paquets installés dont le nom commence par perl ou finit par python
`~i (~n perl$ | ~n ^python )`  les paquets qui pourraient servir d'alternative au mta actuel
`~seditors` les editeurs et outils associés disponibles en paquet
`~n ^fonts- !~i ~dprog` les ttf pour les développeurs

aussi parceque sans configuration, aptitude garde des traces de son passage. du coup

* aptitude purge désinstalle bien plus de choses qu'on apt purge
* `aptitude why` permet de savoir pourquoi un paquet est installé sur le système

    aptitude why $(
        dpkg -S $(which cpan-upload) |
            cut -f1 -d:
    )

    i   dh-dist-zilla      Dépend libdist-zilla-perl
    i A libdist-zilla-perl Dépend libcpan-uploader-perl (>= 0.103004)

## configurer automatiquement

* `debconf-utils` produit debconf-get-selections
