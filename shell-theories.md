% Shell et théories

http://en.wikipedia.org/wiki/Cat_(Unix)#Useless_use_of_cat
http://merrigrove.blogspot.fr/2013/12/the-occultation-of-relations-and-logic_22.html
http://okmij.org/ftp/Computation/monadic-shell.html 

 ${a[1]:-haha} $a[2,-1]
 @_ ? @_ : ("haha")



Il sert très bien le propos de l'auteur et l'article est d'une qualité qui se
fait rare sur le net. Merci à son auteur.

Toutefois, le script est tiré d'une réponse qui fut donnée sur serverfault (je
n'ose même pas regarder l'original) et l'auteur évoque un Jedi qui montre le
vrai pouvoir d'unix … elle est loin la république.

A titre personnel, je refuserais que ce genre de scripts soient 


## le 



    cat /var/log/nginx-access.log |
                       grep "GET" |
           awk -F'"' '{print $6}' |
                    cut -d' ' -f1 | 
           grep -E '^[[:alnum:]]' |
                             sort |
                          uniq -c |
                          sort -rn 



    $F[2] ~~ /^GET/ or next;
    ($_) = split " ", $F[5];
    $M{$_}++ if /[[:alnum:]]/;

    END {

    } 

cat << EOT
127.0.0.1 - - [19/Jun/2012:09:16:22 +0100] "GET /GO.jpg HTTP/1.1" 499 0 "http://domain.com/htm_data/7/1206/758536.html" "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; SE 2.X MetaSr 1.0)"
127.0.0.1 - - [19/Jun/2012:09:16:25 +0100] "GET /Zyb.gif HTTP/1.1" 499 0 "http://domain.com/htm_data/7/1206/758536.html" "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; QQDownload 711; SV1; .NET4.0C; .NET4.0E; 360SE)"
127.0.0.1 - - [19/Jun/2012:09:16:25 +0100] "GET /Yyb.gif HTTP/1.1" 499 0 "http://domain.com/htm_data/7/1206/758536.html" "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; QQDownload 711; SV1; .NET4.0C; .NET4.0E; 360SE)"
127.0.0.1 - - [19/Jun/2012:09:16:25 +0100] "GET /GO.jpg HTTP/1.1" 499 0 "http://domain.com/htm_data/7/1206/758536.html" "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; QQDownload 711; SV1; .NET4.0C; .NET4.0E; 360SE)"
127.0.0.1 - - [19/Jun/2012:09:16:30 +0100] "GET /Zyb.gif HTTP/1.1" 499 0 "http://domain.com/htm_data/7/1206/758536.html" "Opera/9.80 (Android; Opera Mini/6.7.29878/27.1667; U; zh) Presto/2.8.119 Version/11.10"
127.0.0.1 - - [19/Jun/2012:09:16:30 +0100] "GET /GO.jpg HTTP/1.1" 499 0 "http://domain.com/htm_data/7/1206/758536.html" "Opera/9.80 (Android; Opera Mini/6.7.29878/27.1667; U; zh) Presto/2.8.119 Version/11.10"


awk '$3 ~ /^GET / { print $6 }' /var/log/nginx-access.log |
    sed -rn '
        s/ .*//
        /^[[:alnum:]]/p' |
        sort    |
        uniq -c |
        sort -rn


 
$HTTP ~ /^GET / { print $UA } 


user_agents_ () { awk '$3 ~ /^GET / { print $6 }' "$@" }
user


sort_by_occurrence () {
}


awk '$3 ~ /^GET / { print $6 }' /var/log/nginx-access.log |
    sed -rn '
        s/ .*//
        /^[[:alnum:]]/p
    ' | sort | uniq -c | sort -rn  


/var/log/nginx-access.log 

cat | grep "GET" |
          grep -E '^[:alnum:]]' | sort | uniq -c | sort -rn  ]

