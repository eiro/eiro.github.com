% exercices

# /tmp/getcert

le fichier `/tmp/getcert` contient un script zsh qui permet d'afficher
les données SSL du serveur IMAP de l'unistra.

* lancez ce script
* extraire le certificat du contenu ainsi affiché.
* stocker le dit certificat dans ~/imaps.u-strasbg.fr.pem  

# list

creez une commande list telle que  

    # seq 5|list
    [ 1
    , 2
    , 3
    , 4
    , 5 ]

    seq 5

# table de 7 

Afficher la table de 7 avec le format

    1 * 7 = 7
    ...
    10 * 7 = 70

# votre serveur de fichiers 

créez dans votre home un répertoire users qui contient un sous répertoire par utilisateur de zsh de votre systeme.  

ce sous-répertoire aura le meme nom que l'utilisateur et contiendra

* 1 fichier uid contenant l'uid de l'utilisateur 
* 1 fichier display contenant les noms
  et prenoms de l'utilisateur  

ainsi 

    # grep . users/mc
    users/mc/display: Marc Chantreux
    users/mc/uid: 1000

# des logs a une liste de paquets debian

transormez


    SOME DEPENDENCIES WERE MISSING.
    MAILGATE missing dependencies:
            Mozilla::CA ...MISSING
    CORE missing dependencies:
            Crypt::Eksblowfish ...MISSING
            Time::ParseDate ...MISSING
            Encode >= 2.64 ...MISSING
    GD missing dependencies:
            GD::Graph >= 1.47 ...MISSING
    GPG missing dependencies:
            PerlIO::eol ...MISSING
    PG missing dependencies:
            DBD::Pg >= 1.43 ...MISSING
            DBIx::SearchBuilder >= 1.66 ...MISSING
    DEVELOPER missing dependencies:
            Plack::Middleware::Test::StashWarnings >= 0.08 ...MISSING  

en 

    mozilla-ca
    crypt-eksblowfish
    time-parsedate
    encode
    gd-graph
    perlio-eol
    dbd-pg
    dbix-searchbuilder
    plack-middleware-test-stashwarnings

avec vim 

    /^\t
    v##d
    s#
    s# .*
    s#::#-#
    gvu

en shell

    sed -nr '
        s/::/-/g
        s/^\s+(\S+).*/lib\1-perl/p
    '  

# extra: perl as filter

'<,'>!perl -lnE'/^\s/ && say map {s/::/-/g;lc} /(\S+)/'   
'<,'>!perl -lnE '$a = lc join "", /\b\w/g; print "$a $_"'


