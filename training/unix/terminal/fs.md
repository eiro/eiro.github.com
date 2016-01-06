# les systèmes de fichiers

* on appelle \important{filesystem (fs)} un système représentant
  une \important{collection hiérarchique d'objets} sous la forme de fichiers
  et de répertoires. (partitions de disque dur, clef usb, vues SQL, table
  de processus, ...).
* tout répertoire vide peut servir de \important{point de montage}
  pour un autre fs.
* le premier point de montage est appellé \important{racine} (noté `/`)

# exemples de fs

* fs de partitions: `ext4`, `zfs`, `fat32`, `ntfs`, `ufs`
* fs spéciaux: `sshfs`, `procfs`, `sysfs`, `ramfs`, `fuseiso`, `Fuse::DBI`
* `fuse` et `9p` permettent d'exposer tout type de données dans un fs
  en implémentant des \important{syscalls} (open, walk, read, write, ...)

# les fichiers

* les \important{fichiers} sont des unités contenant un ensemble
  cohérent d'information.
      * sa structure interne est appellé \important{format}
      * l'organisation de données dans ce format est appellée \important{sérialisation}
      * l'opération inverse est appellée \important{désérialisation}
* des méta-informations lui sont associés
    * le `owner`, le groupe, les droits (`ls -l`)
    * les dates de dernier accès, modification et changement (`stat`)
* le tout est regroupé au sein d'une structure appellée \important{inode}
  associé par une valeur numérique unique dans son fs.

# les répertoires

* les répertoires sont des collections pouvant contenir des fichiers et des
  répertoires (appellés \important{sous-répertoire})
* le contenant est appellé \important{parent} et le contenu \important{enfant}.

# exemple d'arborescence

* les arborescences sont très variables d'un unix à l'autre
* sous linux, →[FHS (Filesystem Hierarchy Standard)](http://www.pathname.com/fhs/)
  peut donner des indications

# arborescence linux  (1)

\tikz[
    every node/.style={ rectangle,  draw, rounded corners=0.2cm },
    also/.style={ rectangle,  draw, rounded corners=0.2cm, fill=gray!20 },
    virtual/.style={ rectangle,  draw, rounded corners=0.2cm, fill=red!10 },
]{
    \node (root) {/}
        child { node {etc}
            child { node {init.d}   }
            child { node {nginx}    }
            child { node[also]{...} } }
        child { node {bin} }
        child { node {root} }
        child { node {home}
            child { node {jdoe} }
            child { node {bill} }
            child { node[also]{...} } }
        child { node[also]{...} }
        ; 
}

# arborescence linux (2)

\tikz[
    every node/.style={ rectangle,  draw, rounded corners=0.2cm },
    also/.style={ rectangle,  draw, rounded corners=0.2cm, fill=gray!20 },
    virtual/.style={ rectangle,  draw, rounded corners=0.2cm, fill=red!10 },
]{
    \node (root) {/}
        child { node {var}
            child { node {log} }
            child { node {spool} }
            child { node[also]{...} } }
        child { node[virtual] {dev} }
        child { node[virtual] {proc} }
        child { node[virtual] {sys} }
        child { node {usr}
            child { node {local} }
            child { node {lib} }
            child { node {bin} }
            child { node {share} }
            child { node[also]{...} } }
        ; 
}

# propriétés et droits

* un utilisateur est membre d'un groupe principal
  (facultativement de groupes secondaires)

# navigation

* tout processus possède un \important{repertoire courant}
* `/` est (aussi) le séparateur dans la notation les chemins
* les fichiers dont le premier caractère du nom est `.` sont \important{cachés} par convention
* tout répertoire possèdent deux sous-répertoires spéciaux:
  `.` (lui-même) et `..` (son parent)
* les chemins sont des notations des noms des ressources présentes dans l'arborescence
* tout utilisateur possède un répertoire de travail: some \important{home directory}

# inspecter le répertoire courant

~~~{.zsh}
    pwd
    ls
    ls -A  # tous les fichiers
    ls -d  # le répertoire, pas son contenu
    ls -l  # informations supplémentaires
    ls -sh # tailles
~~~

# naviguer (chemins absolus)

navigation depuis la racine

~~~{.zsh}
    cd /       
    cd /home/mc 
    cd /var/log
~~~

# naviguer (les homes)

~~~{.zsh}
    cd ~       # home
    cd         # home
    cd ~jdoe   # home de jdoe
~~~

# naviguer (chemins relatifs)

~~~{.zsh}
    # /var/log ou /usr/local/var/log ou ...
    cd ~jdoe/../../var/log
    cd ~/..    # répertoire parent du home
~~~

# naviguer (chemins relatifs au répertoire courant)

~~~{.zsh}
    cd .       # répertoire courant
    cd ./foo   # sous-repertoire "foo" du répertoire courant
    cd foo     # idem
    cd foo/bar # (courant) → foo → bar
    cd ..      # répertoire parent
    cd ./..    # répertoire parent
~~~

# naviguer (chemins relatifs au répertoires courants précédents)

un historique des répertoires peut être maintenu avec `pushd` et `popd`

~~~{.zsh}
    cd bar
    pushd foo  # push bar dans l'historique
               # cd dans foo
    pushd pan  # push bar dans l'historique
               # cd dans pan
    popd       # retour dans foo 
    popd       # retour dans bar
~~~

# setopt autopushd 

~~~{.zsh}
    cd -       # pénultième courant
    cd -1      # pénultième courant
    cd -2      # anté-anté-pénultième courant
    cd -...
~~~

# cd est inutile

~~~{.zsh}
    cd ~
    ls
~~~

~~~{.zsh}
    ls ~
~~~


