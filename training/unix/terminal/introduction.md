# Unix

* la famille de systèmes d'exploitations\
  (macOS, les BSD, linux, android, ...)
* culture (des formalismes et pratiques presque communes)
* des "standards" (POSIX, ...) et différents des degrés d'adoption


# chaque diapo ...

* j'ai du faire des choix (pratiques courantes, intéressantes, ...)
* être exhaustif est inutile est chronophage (RTFM)

# buts de cette formation

* comprendre et intégrer les bases culturelles par l'utilisation
  par la manipulation des outils standard.
* aquérir les bases pratiques permettant de réaliser et automatiser
  des taches simples sous Unix grace à des outils standard
  (si possible tels que définis par
  →[POSIX](http://pubs.opengroup.org/onlinepubs/9699919799/idx/xcu.html)).

3 jours de modernité (distribution, parallèlisme, ...) dans un monde sans souris:
bienvenu dans "le terminal"

# "le terminal" ?

|outils |fonction|
|-:|:-|
|putty               |émulateur de terminal            |
|                    |client ssh                       |
|zsh                 |shell                            |
|tmux                |un multiplexeur de terminaux     |

|outils |fonction|
|-:|:-|
|editeur de texte|vi                 |
|fichiers |navigation, manipulation, edition|
|processus|les I/Os|
|filtres|cut, join, cmp, grep, sed, awk, m4|
|build automation|make|

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

# shells actuels

* minimalistes: strict respect du standard
* fonctionnels: ajout de fonctionnalités utiles (completion, coloration syntaxique,...)

|dialecte|implementation|orientation|par défaut sous|
|:-|:-|:-|:-|
|sh|dash|minimaliste|`/bin/sh` (certains linux)|
|ksh|pdksh|minimaliste|`ksh` (certains bsd)|
|ksh|mksh|fonctionnel|`ksh` (certains bsd)|
|sh,ksh|bash|fonctionnel|`/bin/sh` (certains linux)|
|sh,ksh,csh|\textbf{\color{red}zsh}|fonctionnel|`/bin/sh` et  `/bin/ksh` (certains linux)|

# connexion

live demo avec putty ...  mais depuis unix:

    ssh user@machine
    ssh user@machine echo hello world
    seq 5 | ssh user@machine grep 2 | tr 2 X

# Read, Eval, Print Loop (REPL)

\smartdiagram[circular diagram]{Read,Eval,Print}

# en pratique {.fragile}

le prompt (`$PS1`)

\begin{zsh}
    <@\prompt@>
\end{zsh}

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

# edition

les touches essentielles

|||
|-:|:-|
| \keys{\arrowkeyleft},\keys{\arrowkeyright} | déplacer le curseur dans l'instruction |
| \keys{\backspace}                          | supprimer un caractère                 |
| \keys{\return}                             | valider les instructions               |
| \keys{\arrowkeyup},\keys{\arrowkeydown}    | naviguer dans l'historique             |
| \keys{\ctrl + d}                           | quitter                                |
| \keys{tab}                                 | completion (contextuelle?)             |

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

# pager, documentation

`less`, `apropos`, `man`

