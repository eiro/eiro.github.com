% homepages are useless

and generously hosted by [github](http://github.com).

# atom files

* [the whole thing](atom.xml)
* [unixtips](unixtips.atom.xml)

# improve this site

the [Makefile of this site](https://github.com/eiro/eiro.github.com/blob/master/Makefile)
is so simple i now have

* 3 sites managed with it, all of them growning
* 2 people using a forked version 

can i add things without compromising with simplicity? i think so. 

* investigate sharing rules 
* better flow for the atom syndication, something like

    lang = ( fr en ) 
    whole = Σ whole.$lang
    whole.$lang =  Σ $theme.$lang
    theme.$lang = Σ subthemes.$lang 
    ...

or does taxonomies sucks ? how about a translated post about perl communities ?
crossposting ?

