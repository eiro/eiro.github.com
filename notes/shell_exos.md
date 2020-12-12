
# commands

| spreadsheet | awk, [miller](https://github.com/johnkerl/miller), cut, perl -F, sort, join, paste, xargs |
| math  | hoc, dc,bc,  |
| datastructures | xmlstarlet, jq |
| video | ffmpeg, blind, [mlt](https://tracker.debian.org/pkg/mlt) |
| storage | redis, sqlite |


# transformer une liste de scripts en fichier startup

     ls scripts |
        sed 's/^/script load /' > startup  


# envoyer un résumé des sujets des listes sympa au format csv

    grep -P '(?x) ^ subject \s+ ' uds-*/config |
        sed 's#/config:#;#' > listes.csv

# résumé des listes sympa au format html 

    cd ~u
    for l ( uds-*/config ) {
        echo "# ${l%/*}: " $( sed -rn 's/^subject +//;T;p;q' $l )
        echo 
        sed -rn '/^owner/,/^$/s/email +//p' $l |
            sed 's/.*/* [&](mailto:&)/
        echo 
    } | pandoc > $website/sympa.html

# générer le script de startup 

     ls scripts |
        sed 's/^/script load /' > startup 



