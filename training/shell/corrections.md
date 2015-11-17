# list

    sed '
    s/^/, /
    1s/./[/
    $s/$/ ]/'

# table de 7 

    seq 10|
        sed '
            s/.*/print & \\* 7 = \$\( expr & \\* 7 \)/
        '| zsh 

# votre serveur de fichiers

