# intensifier l'usage de tmux dans les formations

* un keylogger pour que les stagaires voient les
  saisies
  (cf? https://github.com/concise/tmux-keylogger/blob/master/keylogger)
* relancer got pour permettre de l'assistance entre stagiaires
  et/ou avec le formateur

# expansion

    print("hello","world")

    print hello world
    $0   $1    $2

    print("hello","  world")

    print hello \ \ world
    $0   $1    $2

    print hello '  world'
    $0   $1    $2

    fonctions variadiques

    name () instruction

    block: regrouper des commandes

    name () {
        instructions
        # separés par des \n et ;
    }

    greetings () print hello world
    greetings

    variable expansions

    greetings () print hello $USER
    USER= greetings

    greetings () print hello $1
    greetings john

    greetings () print hello ${1:-${USER:-word}}
    greetings john
    USER=mc greetings
    USER= greetings

    greetings () {
        print hello ${1:-${USER:-word}}
        date +'nous sommes %A'
    }

    iwill () {
        echo i will $@
        $@
    }
    iwill echo this is it

    user='marc chantreux' login=mc

# filtres

    TODO: stdio
    TODO: processus et heritage
    TODO: repl

        but d'un programme unix: écrire le plus rapidement
        sur stdout

        * generateur genere une sequence (un item par ligne)

        yes () {
            local msg=${*-1}
            while {true} {print $msg}
        }

        print -l {1..10}
        while {read line} {echo $line ; echo $line }
        natural () {
            local k v r from=0 to=inf step=1
            for k v { print -v $k $v }
            while (( from <= to )) {
                echo $from
                (( from += step ))
            }
        }

        natural from 1 to 100 |
            awk '{$2 = $1 * 2 ; print }'

       extensbile en C

           seq 10

       en tout:

       runhaskell <<< 'main = mapM (putStrLn . show ) [1..10]'
       bc <<< 'i=0; while (i+=1 <= 10 ) i'
       :|awk 'BEGIN { i=0; while (i++<=10) print i }'
       perl -E'say for 1..10'


    TODO: redirections, fifo, pipes

    #

    globstarshort vs fd/find/

    l *c
    l **~*/C*(.)
    l **~*/C*(.D)

    # sort/map/grep

    colors=( blue red black white )
    local -A difficulty=(
        white 1
        black 3
        blue  4
        red   7
    )
    by_difficulty () REPLY=$difficulty[REPLY]
    # TODO: don't work :(
    # l ${(oe:'REPLY=$difficulty[REPLY]':)colors}
    # l ${(o+by_difficulty)colors}

    dark=( blue black )
    warm=( red )
    players=( 'my lady' dead joe )
    print ${(O)colors}
    print ${(o)colors}
    print ${colors:#b*}
    print ${(M)colors:#b*}
    print ${colors:#*e}
    print ${(M)colors:#*e}
    print ${colors:|dark}
    print ${${colors:|dark}:|warm}
    for p c ( ${players:^colors} ) print "$p: $c"

    by_long () REPLY=$#REPLY
    mkdir -p lt
    @ ( lt/{a,aa,aaa,aaaa,aaaaaa} ) touch $it
    l lt/*(o+by_long)
    l lt/*(Oe:'REPLY=$#REPLY':)


    # filter function

    mkdir -p lt
    @ ( lt/{a,aa,aaa,aaaa,aaaaaa} ) touch $it
    by_long () REPLY=$#REPLY
    l lt/*(Y4O+by_long)

    wc -l /etc/passwd | awk '{print $1}'
    l ${#${(f)"$(</etc/passwd )"}}
    path('/etc/passwd')->getlines + 0

    local -A conference_name
    set   -A conference_name new tpc old yapc
    l ${(k)conference_name}

# things i want to see in perl

    perl //n free $1, $2, ...
    Tie $_ , @F, $1, $2, ...

    so like in awk:

    perl -E '
        push @F, $1 + 42;
        print
    '
    * perl -Mawk

# exo:

    nospam- () sed ${(j:;:):-s/${^${(s::)1}}//}
    nospam- NOSPAM <<<  NmOc@SexPempleA.Mbiz

perl -wsE'say $foo' -- -foo=bar

# exo

    qui est evalué par quoi
    awk -F\: '{ print "<td>"$1"</td>" }' /etc/passwd

* implementer seq
    seq ${1?last}
    seq ${1?first} ${2?last}
    seq ${1?first} ${2?range} ${3?start}
* implementer top ( sed "$1\q")

# exo

    sed '
        s/([0-9]),\?//g
        s/ \+/\nman /g
    ' <<< ' gc(1), dot(1), acyclic(1), gvpr(1), gvcolor(1), ccomps(1), tred(1), libgraph(3)'
    cmds=' gc(1), dot(1), acyclic(1), gvpr(1), gvcolor(1), ccomps(1), tred(1), libgraph(3)'
    seq 3 100000 | sed -n '1~3p'|sed -n '5 {p;q}'
    (l=0; while {true} {print $[i++]}) |sed 5q

