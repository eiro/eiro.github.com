% notes relatives à unix

# récuperer les données contenues dans un odt foiré

il m'a été fourni un fichier `m.odt` corrompu. après avoir cherché sur le net
et dans le fichier (utilisant `xxd`, fourni avec `vim`), j'ai observé que la clef PK
(qui est habituellement et logiquement en début de fichier) était perdu au millieu du fichier.

j'ai donc tenté de récuperer le stream a partir de ce moment là. via `xxd`:

    0008990: 4b03 0414 0008 0808 0036 7be1 4400 0000  K........6{.D...

dans bc:

    ibase=16 
    000898F
    > 35215

récupération des données (sachant que la fin du flux est définitivement perdu). 

     tail -c +35216 m.zip | gunzip -f > restes.txt

editer ensuite manuellement `restes.txt` pour y récuperer des données (dans le
xml correspondant au contenu du document en particulier).

# plan9

de base, le keyboard de plan9 est en anglais. fix:

    kbmap
    # selection fr
    acme ~/lib/profile

# plan du cours unix

## généralités

* qu'est ce qu'unix

    * rappeller les origines et expliquer que les unices modernes partagent une
    une base culturelle, des outils et des mecanismes communs.

    * unix aujourd'hui: des     
    
    les grands unices actuels: 


* gestion des processus
* make, m4, install
sudo install -d titta -g www-data -o www-data

test


  install, make, m4
install -o mc -g users -d fuck/toto/tata 

# choisir son shell

* le cout de fork + exec (depend du poids des commandes)
* pipe: on demande et read/write bloquant
    analogie avec l'eau:
    * s'écoule en replissant les cases ? 
    * prendre un seau dans la tete? 
* man test vs [ vs [[ vs ~
* read/write vs passer un pointeur
* les libs (source, . u/std)
* lisibilité
  - écrire les generateurs
  - true in the nutshell
    * true, et operateurs booleens
    * les valeurs de retour
    * $? 
    * failed ()
