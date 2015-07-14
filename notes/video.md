% Notes on screecast production

# blender video editing

    G grab
    shift pour selectionner multiple 
    ctrl-z annuler 
    k soft cut 
    s-k hard cut 
    h alt-h toggle hide  
    http://mindthecode.com/recording-a-website-with-phantomjs-and-ffmpeg

# découpage de fichiers `.ts` avec `dd`

soit

* `source.ts` le fichier enregistrement
* `target.ts` la sous-partie de `source.ts` a isoler
* `n` la taille en `bs` (ici 4Mo) de toutes les sous-parties précédentes
* `m` la taille de la présente sous-partie

la commande 

    dd if=source.ts of=target.ts bs=4M skip=n count=m

produit le nouveau ts.

le resultat d'un encodage video n'étant pas linéaire en taille, il faut découper
par un découpage empirique (générer des vignettes avec vlc aiderait pe). 
On peut jouer sur la taille du bs pour avoir plus ou moins de précision.

# test usb streaming

pour utilisation des vieux camescopes

