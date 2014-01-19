% Perl

Cet article est mon recueil de bonnes pratiques pour les perl oneliners (qui
font d'ailleurs rarement une ligne). je pars du principe que vous avez des
bases de sed et awk (si ca n'est pas le cas: il est temps).


# les flags

perl -wsE 'say $foo' -- -foo=bar

foo="bar" perl -Menv -wsE 'say $foo'



