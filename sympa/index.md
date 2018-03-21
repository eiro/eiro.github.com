% personal notes and todo lists about sympa

# state

current proposals

    rfc autodie     closed
    rfc utf*        intelligence required
    rfc Moo         waiting for consensus (i'm on the racke position)
    rfc Path::Tiny  pending
    rfc DBIx::Class wip (from today)
    rfc PEP         wip (from today)
    rfc Dancer2     pending
    rfc licence     pending
    documentation   wip

current experiment

    debian
    opensmtpd
    nginx + (gazelle|Feersum|uwsgi)

# tips

## vim

* if you add `src/lib` to your `$PERL5PATH̀`, you can `inex` is
  set so you can `gf` on a module name.
* you can create a tags file using

    ctags --R --language=perl


# others

you can create the schema by using

    sympa --health-check

the current schema is on its way to be wrapped to DBIxC.

check les logs: tmux rocks.

    sudo tmux \
        new "journalctl -xf" \;
        split-window "tail -fn0 /var/log/mail.*[^g1]"

# todo ?

créer un template pour le fichier de conf nginx ? deploy via sympa ? :)

fcgiwrap dans le paquet mais franchement: virer ces trucs au profit de plackup!

# installation check list

* installer cpanm + make + cc + task-sympa + fcgi
* cool debut de doc opensmtpd https://github.com/sympa-community/sympa/issues/32
* peupler la base avec

    sympa --health-check

* faire une premiere cnx pour tester que les messages passent
* 

sudo apt-get install certbot  et renouvellement du certif en cron
apt install certbot
https://github.com/kazeburo/Gazelle vs uwsgi
