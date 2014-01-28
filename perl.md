% Perl

# installation de paquets perl

WARNING (a moins d'une nouveauté?):
ne pas utiliser un client cpan en root pour éviter de placer dans les
répertoires du système des fichiers malaisés à supprimer.

différentes solutions existent

## créer des paquets systeme

* sous debian, voir [ma page sysop](sysop.html).
* sous les rpm-based, on utilisait un truc a biblibre ... je sais plus...
* sous macos, j'avais écris
 [cpan2port](https://trac.macports.org/wiki/howto/cpan2port) qui est tjrs
 utilisé par la communauté macports. toutefois:
 * il semble que [homebrew](http://brew.sh/) soit maintenant plus utilisé.
 * comme macos est un des rares unices qui me sorte vraiment par les yeux,
   je ne sais pas ou tout ca en est.
* sous windows, [Strawberry Perl](http://strawberryperl.com/) et son client
  CPAN ou le perl de [cygwin](http://cygwin.org/).

## installer dans son home

les installations de `cpanm` (un client cpan lite)  sont décrites
[ici](http://search.cpan.org/~miyagawa/App-cpanminus-1.7001/lib/App/cpanminus.pm#INSTALLATION).
Le package debian s'appelle `cpanm`.

# notes pour un tuto perlrun (faire le lien avec awk)

Cet article est mon recueil de bonnes pratiques pour les perl oneliners (qui
font d'ailleurs rarement une ligne). je pars du principe que vous avez des
bases de sed et awk (si ca n'est pas le cas: il est temps).

# les flags

perl -wsE 'say $foo' -- -foo=bar

foo="bar" perl -Menv -wsE 'say $foo'



