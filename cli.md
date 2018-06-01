# gitolite

je pars du principe que

* je suis le sudoer `marc` sur la machine `deathstar`,
  je suis sur deathstar avec un agent ssh.
* gitolite sera dispo via `git@deathstar`
* je serais admin de gitolite, connu par lui comme étant `eiro`

    sudo adduser --disabled-password --home /srv/gitolite --shell /bin/sh git
    key=~git/eiro.pub
    from=~marc/.ssh/id_rsa.pub
    sudo install -o git $from $key
    sudo -i -u git <<< '
        set -e
        b=$HOME/bin
        git clone https://github.com/sitaramc/gitolite.git
        mkdir -p $b
        gitolite/install -to $b
        PATH="$b:$PATH"
        gitolite setup -pk ' $key

recommencer:

    deluser --remove-home git

## administration

depuis n'importe ou

    git clone git@deathstar:gitolite-admin death
    cd death

maintenant il faut lire la doc sur
[le fichier de conf et les clefs](http://gitolite.com/gitolite/admin.html#adminrepo)

### hooks

* mettre en place des hooks sur gitolite. la doc est [ici](http://gitolite.com/gitolite/cust.html)
* truc simple pour lister/supprimer les depots
* stats sur les depots (dernier usage)
* hooks pour differ les .doc ?

    $ cat > hooks/common/post-receive
    #!/bin/sh
    GIT_WORK_TREE=/var/www/www.example.org git checkout -f

# git-extensions

il faudrait pouvoir:

* virer le bouton donate
* virer menu github
* configurer `--depth` au moment du clone


