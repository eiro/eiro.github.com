# human

ls -h | sort -h # idiot computing in action 
ls -s | sort | human '%Mo' # unix philosophy made right 
ls -s | awk ' $1 > 10000 {print}' |  sort | human '%Mo' 
human () { perl -MNumber::Bytes::Human=format_bytes -lnE 's/\d{3,}/format_bytes $&/eg' "$@" }""}
(projet a réécrire en C)

# Blender

lecture collaborative:

    http://fr.flossmanuals.net/blender-pour-le-jeu-video/
    http://fr.flossmanuals.net/blender-pour-le-jeu-video/ch002_pourquoi-utiliser-le-blender-game-engine
    http://okamstudio.com/tech/

# UX html dev

https://github.com/knsv/mermaid link vers dagre
http://metricsgraphicsjs.org/examples.htm 
livescript
polymer vs acmeic widgets

theme "deathrow"

    # #999486
    # #999346
    # #999384
    # #999395
    # #999486
    # #999309
    # #999169
    # #999141
    # #999427
    # #999106
    # #987
    # #934
    # #984
    # #702
    # #551 

