% Lyon patch -p3 et les suites possibles

Avec le soutient financier des _MONGUEURS (que je remercie au passage), j'ai pu
me rendre avec 2 nouveaux mongueurs (_JEF et Julien "kernel" Simonet de l'_ARN)
à Lyon avec dans l'idée de faire avancer des
[des modules existants](http://patch.pm/p3/wiki?node=Projets). Et là ...

# "We need to talk about SPORE"

au début du hackathon, je me rend compte que se trouvent dans la même pièce

* _LIZMAT, une experte Perl6
* [François Perrad](https://github.com/fperrad), contributeur de la première
  version de la spécification de _SPORE, auteur et mainteneur de
  [l'implémentation Lua](https://github.com/fperrad/lua-Spore).
* _JEF, auteur et mainteneur de l'implémentation _GROOVY (_GSPORE) et
  probablement co-auteur de la [version
  livescript](https://github.com/unistra/ls-spore). Il travaille dans l'équipe
  de _AGRAUSEM à l'_UNISTRA, ce dernier étant le papa de
  [Britney](https://github.com/agrausem/britney), la version
  [python](http://python.org).
* moi-même, intermitant du spectacle a la recherche d'emploi, presque diplomé
  de la [zavata school of bullshit](http://perdu.com/).

Rapidement, donc, les discutions se sont orientées vers _SPORE. _JEF explique
que la simplicité et la souplesse de _SPORE ont permis à cette spécification de
s'inserer dans des parties centrales du système d'information de l'_UNISTRA et
que la popularité de la solution est grandissante. Il rapporte toutefois
quelques manques dans la spécification qui ont été rapportés par _AGRAUSEM il y
a qq années. les pull request sont restées lettres mortes.

François explique que ces manques sont connus, qu'une spécification a été
discutée lors des [Journées Perl 2012](http://journeesperl.fr/fpw2012/) sans
avoir été complètement rédigée mais les idées se voient déjà implémentées dans
[lua-spore](https://github.com/fperrad/lua-Spore).  A cette occasion, l'équipe
se demandait pourquoi _SPORE n'avait pas rencontré un plus large succès tant il
est vrai que cette idée simple fait gagner un temps fou (et d'autant que des
spécifications qui nous semblent moins intéressantes conceptuellement sont
apparues par la suite).

Afin de réactiver cette communauté, François nous a ajouté (Arnaud et moi-même)
comme membres de [l'organisation SPORE](https://github.com/spore)
de [github](https://github.com/).

Cette réactivation (la définition d'objectifs sur lequels je reviendrai dans un
prochain billet) à mes yeux un motif suffisant de satisfaction.

# coté code

J'ai profité des moments de la discution sur les manques de _SPORE nécessitait
d'avoir un peu d'experience en la matière pour écrire un micro _POD4(Dist::Zilla)
pour _PERL6: [p6sm](https://github.com/eiro/p6-p6sm) est sur github.

Ensuite, nous avons profité de l'expertise et la patience de _LIZMAT pour
experimenter les possibilités de metaprogrammation de Perl6 (ou pour être plus
franc nous avons simplement appliqué sans varier les idées qu'elle nous a
proposé) ce qui nous a rassuré: même si les namespaces sont immutables une fois
clos, il est possible de créer des classes anonymes. en plus d'avoir un embryon
d'implémentation que j'ai [poussé sur
github](https://github.com/eiro/p6-spore), nous avons surtout été satisfait par
l'élégance des concepts et de la syntaxe de _PERL6.

