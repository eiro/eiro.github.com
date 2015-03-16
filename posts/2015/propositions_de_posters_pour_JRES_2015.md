% propositions de posters pour JRES 2015

"tu parles? tu pars!". ce gros facteur de motivation était la règle à
[linkfluence](http://linkfluence.net) et l'est maintenant dans le pôle de la
direction informatique de l'[unistra](http://www.unistra.fr) ou je travaille.

Il reste quelques jours avant la cloture des CfP pour les
[JRES 2015](https://www.jres.org/en) et faute d'avoir des sujets plus en
raccord avec l'audience (que je crois peu technique) de l'évenement, j'ai une
soudaine envie de posters (ou de présentations format lightning talks). Voilà
donc qq idées que je partage avec vous histoire de récolter vos avis.
n'hésitez pas à me faire parvenir vos remarques (et meme vos [pull
requests](https://github.com/eiro/eiro.github.com/)). Lequel présenter? les
approches et thèmes sont ils-bons ? autres remarques ? D) réponse D? 

# L'écosystème perl, le paradis des administrateur

A l'heure ou j'écris ces lignes (lundi 16 mars 2015, 20:35:41), le CPAN (The
Comprehensive Perl Archive Network) propose 144,578 modules Perl répartis dans
31,486 distributions maintenues par 12,089 authors et disponibles sur 251
mirroirs. ce sera probablement plus dans quelques heures (et c'est ainsi depuis
octobre 1995).

Perl est communauté experimentée de professionnels (soutenus par un nombre
croissant d'entreprises qui choisissent d'utiliser et soutenir Perl) et d'une
miriade de composants logiciels qui exploitent de solides infrastructures et
des  conventions bien établies, reposant sur une forte culture unix et servie
par 20 années de rétrocompatiblité l'interpréteur.

Que faut-t'il savoir aujourd'hui pour utiliser perl ? 

* quels sont les outils pour déployer simplement ? 
* quelles sont les pratiques et outils modernes de développement ? 
* quels sont les bonnes sources de documentation et d'information ? 
* comment trouver de l'assistance ou un support professionnel ? 
* comment intégrer la communauté ?

(3 modules ont été mis à jour sur CPAN pendant la rédaction de ces quelques lignes)

# Automatiser Sympa: les leçons apprises

De l'édition brutale des fichiers de configuration et des données contenues
dans la base à la redaction de scripts Perl utilisant l'API de sympa
directement en passant par le webscrapping et l'utilisation de "sympa.pl", j'ai
tout tenté en attendant la prochaine version majeure de Sympa et son API REST.

Ce poster présente les avantages et inconvenients de chaques méthodes, les
bonnes et mauvaises surprises que m'a réserver sympa, mes espoirs et idées pour
la prochaine version.

# vim, la console d'administation qui vous manquait

Contraints par le temps, les cultures de sites, la taille et le caractère
mouvant de nos systèmes d'informations, nous peinons à développer et maintenir
des interfaces simples et cohérentes nous permettant de débarasser nos
quotidiens de taches chronophages, répétitives ou complexes (y compris en
partant de solutions "clef en main" qu'on se retrouve à adapter en permanence
pendant que ces dernières s'éloignent de nos besoins au fil des versions). 

Nos trousses à outils se réduisent bien souvent à quelques scripts, de bonnes
habitudes qui s'appuient sur des logiciels génériques (la documentation étant
parfois la cerise sur le gateau) et l'esperance de ne pas retomber dans les
embuches courantes. Le temps est à la fois ce qui nous manque pour disposer
d'interface plus construite et ce que nous perdons à ne pas en disposer.

En utilisant vim comme point d'entrée sur notre SI (et en adoptant la méthode
que je propose dans ce poster), chaque tache réalisée est l'occasion de laisser
des tuteurs facilitant une prochaine itération. Petit à petit, vous construisez
simplement des documentations ou des vues du SI qui soient interactives, simples 
et dynamiques.

Pour ma part, vim me permet d'échanger des informations entre ma messagerie, ma
liste des taches, le bug tracker et le wiki du service, les differents outils
d'administration et bases de données (relationnelles, ldap, flat files, REST
APIs ...), des dépots git ... Rien n'est parfait mais mon niveau de
satisfaction dépasse de loin toutes les autres approches que j'ai experimenté
au cours de ma carrière.
