# vim

* au commencement était `ed`
* puis `sed`, `ex`, `vi`, `sam`, les clones et améliorations de `vi`
  (nvi, elvis, yi, izis ...)
* →[vim](http://vim.org) pour "vi iMproved", remplaçant de facto
* →[neovim](http://neovim.io) possible remplaçant

# apprendre vim comme on apprend une langue

* une grammaire, un vocabulaire
* voir l'aide comme un dictionnaire
    * ne pas vouloir tout lire
    * apprendre à trouver l'info
* tout le monde commence en parlant le "petit-vi",\
  ne pas se décourager

# définitions

|||
|:-|-
| les buffers |des zones éditables\
    (traditionnellement un fichier)|
| les fenètres |des zones de l'écran affichant un buffer|
| la barre de status   |permet d'afficher des informations|
| la ligne de commande |permet de tapper des commandes|
| les modes |conditionnent le fonctionnement de vi|

# les principaux modes

\tikz[mode/.style={draw, thick, rectangle, rounded corners, fill=blue!5}]{
    \node (c) at (3,0) [mode]{Commande};
    \node (n) at (3,2) [mode]{Normal};
    \node (i) at (3,4) [mode]{Insertion};
    \node (nxc) at (1,1) {\keys{:}};
    \node (cxn) at (5,1) {\keys{\return},\keys{\esc}};
    \node (nxi) at (1,3) {\keys{i},\keys{a},\keys{o},\texttt{:h Q\_in}};
    \node (ixn) at (5,3) {\keys{\esc}};
    \draw[->] (n.west) edge [bend right](nxc.north);\draw(nxc.south)edge [bend right](c);\draw[->] (c)edge [bend right](cxn.south);\draw(cxn.north)edge [bend right](n.east);
    \draw[->] (n.west) edge [bend left ](nxi.south);\draw(nxi.north)edge [bend left ](i);\draw[->] (i)edge [bend left ](ixn.north);\draw(ixn.south)edge [bend left](n.east);
}

# le mode commande

comme dans le shell

* \keys{\tab} (on note `<tab>`) pour compléter
* \keys{\return} (on note `<cr>`) pour valider
* \keys{\arrowkeyup} et \keys{\arrowkeydown} (on note `<up>` et `<down>`) pour naviguer dans l'historique
* \keys{\ctrl}+\keys{f} pour éditer l'historique

# le mode commande (les incontournables)

|||
|:-|:-|
| `w` | enregistrer |
| `q` | quitter     |
| `h` | aide en ligne |
| `qa`| tout quitter |
| `!` | comme suffixe pour forcer|

* `:waq!` le contenu du buffer courant et quitte
* `:wq!` le contenu du buffer courant et quitte
* `:w! /tmp/foo` le contenu du buffer courant dans `/tmp/foo` et quitte
* \important{pas d'espace avant le !}, la signification serait tout autre

# `:h` $\ggg$ stack overflow

* la commande  `help` ( ou `hel` ou `he` ou `h`) ouvre une fenêtre avec la documentation.
* si `wildmode=longest,list`, \keys{tab} déclenche la completion.
* les bonnes lectures 
    * `:h`
    * `:h quickref`
    * `vimtutor` (depuis le shell)

# `vim --help`, le best of

~~~{.zsh}
    vimdiff new old     # diff entre deux fichiers
    vim scp://r/.zshrc  # machine distante (ou sshfs)
    # les deux ensemble 
    vimdiff {scp://r,~}/.zshrc
    vim                # votre GUI a tout faire
    vim fichier.md +5  # fichier.md ouvert, 
    vim *.md
    ls | vim -      # utiliser vim comme filtre 
    vim - < /var/log/mail.log
~~~ 

# la grammaire du mode normal

* des phrases impératives
* des compléments (mouvements ou blocks)
* des adjectifs numéraux
* des verbes
    * le verbe par défaut est "déplacer le curseur"
    * lorsque le verbe est doublé, le complément est "toute la ligne"

# les mouvements classiques

aide: `Q_lr`, `Q_ud`

|||
|:-|:-|
| `h,l`   | caractère a gauche,droite |
| `j,k`   | ligne supérieure,inférieure |
| `^,0,$` | début, premier caractère significatif, fin de la ligne |
| `{,}`   | début, fin de paragraphe |
| `Fx,fx` | prochain caractère x à gauche,droite |
| `Tx,tx` | juste avant prochain caractère x à gauche,droite |

# les verbes classiques

|||
|:-|:-|
|        | aller à |
| `y`    | copier  jusqu'à |
| `c`    | changer jusqu'à |
| `d`    | supprimer jusqu'à |
| `gu`   | lowercase jusqu'à |
| `gU`   | uppercase jusqu'à |
| `p`    | coller (`puts`) |


# exemples de phrases

~~~{.zsh}
    yy 5p c$ d3w dd dj y2j p ct,
~~~

# le mode commande

~~~{.zsh}
    yy 5p c$ d3w dd dj y2j p ct,
~~~

# les registres

# les marques

# exercice, editez votre fichier ~/.vimrc

    " interactivité
    set hlsearch incsearch

# recherche et motifs


