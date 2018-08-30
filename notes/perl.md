% perl programming langage

# gestion du mail avec perl

module a tester pour remplacer du code sympa ?

    https://metacpan.org/module/Email::MIME::Kit

# dzil

a explorer

    https://metacpan.org/pod/Dist::Zilla::Plugin::Prereqs::Floor
    https://metacpan.org/module/Dist::Zilla::Plugin::Git::Init
    https://metacpan.org/module/Dist::Zilla::Role::VersionProvider
    https://metacpan.org/pod/Dist::Zilla::Plugin::ExecDir
    https://metacpan.org/module/Dist::Zilla::PluginBundle::Dancer
    https://metacpan.org/module/Dist::Zilla::Plugin::GithubMeta

+ faire des templates

# perl et debian

        sudo apt-get apt-file &&
        sudo apt-file update  &&
        dh-make-perl locate

# notes vagues et perso sur des trucs a faire

* articles
  * perl5 en 12 versions
  * les perles du CPAN (Path::Tiny, ...)
  * template toolkit
  * faites dancer perl
  * votre premier module en perl (Makefile.PL, dzil,...)
  * programmation fonctionnelle en perl
  * programmation objet en perl
  * state of oignon
  * Carl Masak about perl6 history
  * unicode en perl
* osdc:
  * ou trouver: clojure, haskell, perl, ruby, python, js, lua
  * slashstar, we're one familly
  * portail des langages 
  * hebergement de projets
* openstreethack 

    * open minded: nous n'aimons pas forcement les technos des autres mais nous
      aimons leurs idées: l'important est d'apprendre
    * distribué: nous voulons pouvoir changer rapidement de lieu, splitter, ...
    * profiter pour faire des outils perl ? gestion des listes, de projets, ...

  * act pour organiser les hackathons? 
    http://blog.freecodecamp.com/2015/06/so-yeah-we-tried-slack-and-we-deeply-regretted-it.html
    richelberger.com/2015/05/06/five-things-i-learned-at-the-nyc-perl-hackathon/ 
    http://blog.urth.org/2015/06/28/managing-many-travis-yml-files/ 
  * faire un resumé de openstreethack #sxb #amsterdam 
  * trouver un premier projet
  * trouver un coding squat
  * trouver un crenau regulier pour les sessions
  * openstreethack au boulot ? 
  * let's run it! strasbourg , amsterdam , london ?  , paris ?  , lyon ?
  * reprendre le log de book  


# integration continue

http://perlhist.com/perl6/flavio-glock
https://travis-ci.org/eiro/app-tables/jobs/63167038#L1895 

# les autres ont dit

## perlbrew ne sert a rien 

    t> sh Configure -des -Dprefix=~/perl/builds/5.20.1 && make && make install
    t> toutes les infos sont dans http://search.cpan.org/~bingos/CPAN-Perl-Releases-2.14/lib/CPAN/Perl/Releases.pm

# perlude

* Ajouter

        foldA { sprintf '(%s)', join ',', @$_ }
            -> map {x} fold 
        foldF { sprintf '(%s)', join ',', @$_ } 
            -> fold filter {x} 

* virer lines
* finir et tester le tutorial 
       Joris, Jeff, Nono, lug ? 
* replude   

# vim

http://www.vim.org/scripts/script.php?script_id=2852 omnifu, vim-perl, ycm ? 
https://github.com/c9s/perlomni.vim

main email address is diego[at]freekeylabs.com You can also reach to me on perl IRC, I'm diegok :-)  

# run external commands 

## Why ?

* i see external commands as the ugliest extention of CPAN
* perl is a glue langage
* qx{is not enough}
    * is it done?
    * is it successfull? 
    * what if i want to interact?  

## how ?

* cpan … 
* search on metacpan : "system command"

    System::Command                  Git::Repository
    RTDevSys::Cmd::Command::system   RTDevSys
    Sys::Cmd                         App::GitHook

    PerlBuildSystem, Rex, Object::Remote …

* search on metacpan : "IPC" 

    even worse 

* Choosen 

CPAN::ReverseDependencies 

# openstreethack

faire un mail sur adherents en expliquant:

* open minded: nous n'aimons pas forcement les technos des autres mais nous
  aimons leurs idées: l'important est d'apprendre
* distribué: nous voulons pouvoir changer rapidement de lieu, splitter, ...
* profiter pour faire des outils perl ? gestion des listes, de projets, ...

# perlrun vs awk

  - se servir de perl -s et awk -v

# choses que j'aimerais avoir dans perl

* les signatures
* le array context pour <> (encore d'actu?)
* nammed parameters to anoymous
    map ($x) { }
* for ( $a, $b ) { ... } (maintenant j'ai pairs et chunksOf)

# Pourquoi perl6 est deja le meilleur langage dynamique pour un nouveau projet

* my only bad 
* ( slang v5 + cpan ) + (perl6 concepts) + (NativeCall + jvm asset)
* perl6 concepts
  * operators, grammars, lists
* sysop and moarvm 

