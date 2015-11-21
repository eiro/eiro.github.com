# Initiation au "terminal unix"

## Unix

* la famille de systèmes d'exploitations\
  (macOS, les BSD, linux, android, ...)
* culture
* des "standards" (POSIX, ...)\
  et différents des degrés d'adoption

## buts de cette formation

* comprendre et intégrer les bases culturelles par l'utilisation
  par la manipulation des outils standard.
* 3 jours de modernité (distribution, parallèlisme, ...) sans souris:
  bienvenu dans "le terminal"

# "le terminal" ?

|outils |fonction|
|-:|:-|
|putty               |émulateur de terminal            |
|                    |client ssh                       |
|zsh                 |shell                            |
|vi                  |editeur de texte                 |
|tmux                |un multiplexeur de terminaux     |

# shells

\begin{tikzpicture}[
    sibling distance=7em,
    every node/.style = {shape=rectangle,
        rounded corners, draw,
        align=center, top color=white, bottom color=blue!20}]

    \node {?}
        child {
        node (bourne) {Bourne shell\\ (\texttt{/bin/sh})}
            child { node (ksh) {Korn Shell}
                child { node (ksh88) {Korn Shell 88}
                    child { node (ksh93) {Korn Shell 93}
                    child { node (bash)  {Bourne\\ Again Shell\\ (bash)} }
                    child { node (zsh)   {Z shell, (\texttt{zsh})} }
                    }
                }
            }
        }
        child { node (csh) {C-shell (csh)}
            child {node (tcsh) {TENEX C-shell\\ (\texttt{tcsh})}}
        }
        child { node (rc) {rc}
            child {node (es) {es}}
        };
    \draw [dotted] (tcsh) -- (zsh);

\end{tikzpicture}

# shells actuels

*  zsh et bash ont le tronc `ksh` en commun
* `dash` se veut compatible avec le Bourne shell et fourni le `/bin/sh` sous
   certaines distributions linux
* `ksh` est spécifié dans `POSIX.2` et plusieurs implémentations
   sont actuellement maintenues (shell par défaut sur certains BSD)

# exemple de différence syntaxique

\newcol
\column{.4\textwidth}

sh, ksh, bash, zsh

~~~{.zsh}

for t in *txt; do
    for i in indexes*; do
        echo "$t $i"
    done
done

~~~

\column{.2\textwidth}


\column{.4\textwidth}

zsh

~~~{.zsh}

for t (*txt)
    for i (indexes*)
        echo "$t $i"



~~~

\delcol

# et d'autres outils standard

|outils |fonction|
|-:|:-|
|gestion des fichiers  | mv, cp, rm, chown, chmod, ...|
|filtres|cut, join, cmp, grep, sed, awk, m4|
|build automation|make|

# connexion {.fragile}

live demo avec putty ...  mais depuis unix:

    ssh user@machine
    ssh user@machine echo hello world
    seq 5 | ssh user@machine grep 2 | tr 2 X

# Read, Eval, Print Loop (REPL)

\smartdiagram[circular diagram]{Read,Eval,Print}

# en pratique {.fragile}

\begin{zsh}
    <@\prompt@> <@\keys{\return}@>
    <@\prompt@> echo hello world <@\keys{\return}@>
    hello world
    <@\prompt@> echo welcome to "the shell" <@\keys{\return}@>
    welcome to the shell
    <@\prompt@> echo bye; echo world <@\keys{\return}@>
    bye
    world
    <@\prompt@> <@\keys{\ctrl + d }@>
\end{zsh}

# edition (les touches essentielles)

|||
|-:|:-|
| \keys{\arrowkeyleft},\keys{\arrowkeyright} | déplacer le curseur dans l'instruction |
| \keys{\backspace}                          | supprimer un caractère                 |
| \keys{\return}                             | valider les instructions               |
| \keys{\arrowkeyup},\keys{\arrowkeydown}    | naviguer dans l'historique             |
| \keys{\ctrl + d}                           | quitter                                |
| \keys{tab}                                 | completion (contextuelle?)             |

# edition (les autres touches)

* être exhaustif est chronophage et inutile
* dépend du shell
* configurable et extensible
* paramètrages par défaut inspirés de emacs et vi

# conventions typographiques

vous tappez

\begin{zsh}
    <@\prompt@> echo bye; echo world <@\keys{\return}@>
    bye
    world
\end{zsh}

sur la diapositives

    z> echo bye; echo world
    bye
    word

et même

    echo bye; echo world

# documentation en ligne

# les variables

    z> echo $USER
    mc

# les variables
