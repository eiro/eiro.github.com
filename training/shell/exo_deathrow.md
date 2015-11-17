---
isa: exo
tags: [sed, zsh, pipe]
...

# Death row

Soit le script suivant

    death_row () {
        curl -s \
        'http://www.lemonde.fr/ameriques/visuel/2014/10/10/voix-d-outretombe-les-derniers-mots-de-condamnes-a-mort-executes-au-texas_4501418_3222.html'
    }

    show_victims () {
        sed -rn 's!.*<(h[23])>#?(.*)</\1>.*!\2!p'|
        sed -n '
            1 x
            2,$ {G;s/\n/\t/p;n;x}
        '
    }

    death_row|show_victims

Réimplémentez show_victims en

* pur shell (en utilisant `(#b)`)
* en un seul script sed
* avec un langage dynamique (python, perl, ruby, ...)

# Solutions

_SOLUC(en zsh)

    show_victims () {
        local line
        while {read line} {
           if   [[ $line = (#b)*\<h2\>(*)\</h2\>*   ]] { dn=$match[1] } \
           elif [[ $line = (#b)*\<h3\>\#(*)\</h3\>* ]] { print $match[1] $dn }
        }
    }

_ASOLUC(bash, ksh, ...)

    # too boring :) 

_ASOLUC(sed en 1 passe)

    show_victims () {
        sed -rn '

            : matchDisplayName
            s!.*<h2>(.*)</h2>.*!\1!
            T matchID
            x
            b

            : matchID
            s!.*<h3>(.*)</h3>.*!\1!
            T
            G
            s/\n/ /
            p


        '
    }

_ASOLUC(en _PERL)

    use LWP::Simple;

    my %people =
        map m{ <h[23]> \#? ([^<]+) }xmsg,
        get @ARGV;

    map {say "$people{$_}\t$_"}
        sort {$people{$a} <=> $people{$b} }
        keys %people;

_ENDSOLUC
