% le tuto minimal pour Perl

# l'interpreteur perl

    getent passwd nobody root |
        perl _PERLFLAG(n) _PERLFLAG(l) _PERLFLAG(F,pattern): _PERLFLAG(E,commandline)'
            say if $F[-1] =~ /sh$/
        '

_PERLDOC(perlrun,perlrun) et _PERLDOC(index-pragmas.html,les pragmas)
par l'exemple et le lien.

    perl _PERLFLAG(w) _PERLFLAG(E,commandline) ' _PERLFUNC(say) "hello world"'

ou plus simplement

    perl -wE' say "hello world"'

ou encore

    perl hello.pl

si `hello.pl` contient

    use _PERLDOCSEC(feature,v5.20,FEATURE-BUNDLES);
    use _POD4(strict);
    say "hello world";

un boilerplate plus classique

    use _PERLDOCSEC(feature,v5.20,FEATURE-BUNDLES);
    use _POD4(strict);
    use _POD4(warnings);
    use _POD4(diagnostics); # au début du moins
    use _POD4(utf8);
    use _POD4(open) qw< :std :utf8 >;
    use _POD4(experimental) 'signatures';
    use _POD4(mro);

Certains modules (comme _POD4(Modern::Perl)) réduisent ce boilerplate
en chargant tout ça pour toi. si tu n'es pas content de ce qui existe, fais 
le tient en utilisant des modules comme _POD4(Import::Into)
ou _POD4(Import::Base) (c'est comme ça que j'ai écris _POD4(Eirotic)).

Pour en venir à _PERLDOC(perlrun), il est très facile de voir _PERL comme un
enfant sous stréroides de sed et awk.

A titre d'exemple, serialiser/désérialiser du YAML au milieu d'un pipe
se fait très facilement

    echo 'firstname marc
    lastname  chantreux
    uid       mc' |
        perl -MYAML=Dump -wlnE'say Dump +{ grep $_, map +(split/\s+/), <> }' |
        perl -0 -MYAML=Load -wlnE'say for keys %{Load <>}

`-E` permet d'écrire un script directement sur la ligne de commande. dans un fichier (disons `hello.pl`), il nous faut ajouter la version de Perl que nous voulons utiliser (TODO: parler de retrocompatibilité).

soit donc le fichier `hello.pl` contenant

qui peut être exécuté avec

    perl hello.pl



possède de nombreuses options décrites dans _PERLDOC(perlrun).



# 

_CPAN est le dépots de bibliothèques _PERL prêts à l'emploi. un "client _CPAN" est un outils qui télécharge, décompresse et installe une de ces bibliothèque.

Nous allons utiliser _POD4(App::cpanminus), ce client

* ne nécessite aucune configuration. 
* permet de spécifier un dépot _CPAN par un simple argument sur la cli
  (ce dépot peut être un des [mirroirs du CPAN](http://www.cpan.org/SITES.html)
  ou votre dépot privé (construit avec _POD4(Pinto) par exemple).
* gère les dépendances (en plus de votre bibliothèque, il installera toutes celles nécessaire à son bon fonctionnement).
* permet d'installer des bibliothèques depuis une archive présent sur le système sans que celle-ci n'aie besoin d'exister sur un dépot (la gestion des dépendances est gérée même dans ce cas).



Se faisant, la plupart des clients _CPAN installe toutes les autres bibliothèques nécessaires au fonctionnement 


installer cpanm

    apt-get install cpanm





