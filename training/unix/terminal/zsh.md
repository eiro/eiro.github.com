# hello world

    echo hello world
    print hello world

|||
|:-|:-|
|echo |l'original, passe partout|
|print|seulement zsh, avec des ajouts intéressants|

* les deux fonctionnent
* j'ai tendance a préferer print

# les instructions

\cmdAnatomyWholeStory

# les instructions (en résumé)

une instruction permet d'évoquer une commande qui accepte d'éventuels 
arguments (parameters). ces composés sont séparés par un ou plusieurs espaces
horizontaux (\keys{space} et \keys{tab}) (les espaces en début et fin de ligne
sont insignifiants).

certains paramètres (les flags) paramètrent le traitement des données 

les instructions sont séparées par des `;` ou des retours à la ligne

# les flags

* paramètre préfixé d'un `-` qui apparait avant `--`
* peuvent se regrouper

## regrouper les flags

~~~{.zsh}
    print -l -O hello world
    print -lO hello world
~~~~

## `--` sépare les flags des autres paramètres

~~~{.zsh}
    z> print -l -kilo-
~~~~

\stderr{zsh: bad option: -k}

~~~{.zsh}
    z> print -l -- -kilo-
    -kilo-
~~~~

# commentaires

`#` introduit un commentaire

~~~{.zsh}
    z> print hello world # commentaires (donc sans effet)
    hello world
~~~~

# expansions

\important{avant} execution de la commande, le shell cherche des motifs
spéciaux dans les paramètres et les remplace par leur expansions.

# expansions

|||
|-|-|
| globs | motifs de recherche de fichiers ou de comparaison de chaine |
| `~` (tilde) | `~` repertoire de travail de ... |
| `{,}` `{-}` | distribution (produit cartésien) |
| `=`         | equivalent de `$(which)` |

~~~{.zsh}
    print jean-{paul,luc}
    print {jean-,}{paul,luc}
    print {5,9}
    print {5-9}
    print -l {5,6}x{1,3} 
    print -l {5,6}x{1-3} # setopt braceccl
    print ~{nobody,root,www-data}
    print ={sh,zsh} # setopt extendedglob
    print ~   
    print ~mc
~~~~

# protection des caractères

* préfixer les caractères avec le symbole`\` (blackslash)
  empêche son expansion. (on parle de protection du symbole)
* un ensemble de symboles entourés par des `'` ou des `"`
* contrairement à `'`, `"`
    * respecte l'interpolation
    * permet l'introduction de caractères d'échappement
      (`"\n"`, `"\t"`, ...)

# exemples

~~~{.zsh}
    print l\'apostrophe,\
    \{l\'accolade}, le \~tilde et même\
    le retour à la ligne

    print "l'apostrophe,
    {l'accolade}, le ~tilde et même
    le retour à la ligne"

    print \\ 
    print "c:\\>  \n\n\n"
~~~~

# variables 

## déclaration

    greetings='hello world'  xp=15

## interpolation

* `$` provoque l'interpolation de variable
* les variables peuvent être
  * exportés lors de la création d'un processus
    (variables d'environement)
  * déclarées dans le shell courant
  * spéciales, elles correspondent à l'état de l'interpreteur
* peut s'effectuer sur la commande 



# exemples

~~~{.zsh}
    print $USER # variable d'environement
    n=5 b=6
    c=\n d=\$n e=$n
    print "n=$n ( $c $d $e )"
    print 'n=$n ( $c $d $e )'

    cmd=print
    $cmd hello

    to=play        # déclaration de variable
    print $tomate

~~~~

pourquoi? 

# setopt nounset

~~~{.zsh}
    setopt nounset
    print $tomate
~~~

\stderr{zsh: tomate: parameter not set}

~~~{.zsh}
    print ${to}mate
~~~

# manipuler les variables

* etre exhaustif est chronophage
* man `ksh` et `zshall` (chercher `%%`)

~~~{.zsh}

    print ${email:=jdoe cs unistra fr}
    email=${email/ /@}
    email=${email// /.}
    print email   : $email
    print domain  : ${email#*@}
    print user    : ${email%@*} 


~~~~

# zsh

nesting

~~~{.zsh}
    email=${${${fake:=jdoe cs unistra fr}/ /@}// /.}
    print email $email from fake $fake 
~~~~

modifiers

~~~{.zsh}
    print ${(U)email}
~~~~

