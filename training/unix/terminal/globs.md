# globs

* permettent de filtrer une collection sur la base d'un \important{motif}
  qui doit correspondre à \important{l'intégralité du nom}.
* en zsh, `setopt extendedglob` permet
  * d'intérroger l'age, la nature, ... 
  * de filtrer sur le nom
  * de modifier la chaine résultante

# introduction

se référer aux manuels

* `ksh` "File name patterns"
* `zshexpn` "FILENAME GENERATION"


# les symboles

* les symboles se représentent eux-même (a, b, -, 0, 9, ...)
* `*` correspond à une suite de 0 à n symboles

# les métacaractères

* représentent un symbole pouvant avoir différentes valeurs

|||
|:-|:-|
| `?`      | un symbole   (a, b, -, 0, 9, ...) |
| `[abc]`  | a, b ou c    |
| `[a-f]`  | une lettre comprise entre a et f |
| `[5-9]`  | un chiffre compris entre 5 et 9  |
| `[^a-f]` | tout sauf `[a-f]` |

# les groupes

|||
|:-|:-|
| `(foo|bar)` | `'foo'` ou `'bar'`       |

# les quantifiers

||||
|:-|:-|:-|
| `A##` | au moins une répétition du A   | 1 à n |
| `A#`  | peut-être des répétitions de A | 0 à n |

# les exclusions

|||
|:-|:-|
| `^A`    | ne satisfait pas A     |
| `A~B`   | satisfait A et pas B |
| `A~B~C` | satisfait A et pas B et pas C |

# les modifiers 

|||
|:-|:-|
| `#b`  | active la capture des groupes (`$matches`) |
| `#i`  | insensible à la casse |

# parcours de répertoire

* le '/' permet de chercher dans des sous-répertoires, chaque motif est
  à lire séparément
* `**` entraine un parcours récursif

# exemples

~~~{.zsh}
    alias l='print -l'
    l */(bin|scripts)/col*[1-9]
    mv ^old old
~~~

# stockage et interpolation de motif

~~~{.zsh}
    images='*.#i(jpe#g,png,svg,gif)'
    l $~images
~~~

# Glob Qualifiers

* des microphrases entre parenthèses à la fin du motif
* remplace `find` dans de nombreux cas

# Glob Qualifiers (exemple)

* les fichiers uniquement `.`
* dont l'extension est `.data`
* créés il y a
   * plus de 10 heures `ch+10`
   * mais moins de 5 jours `cd-5`
* appartenant à matts `u:matts:`
* dont la taille est superieure à 5Go
* triés par taille `oL`
* n'afficher que le basename `:r`

~~~{.zsh}
    *.data(.ch+10cd-5u:matts:L+5goL:r)
~~~
