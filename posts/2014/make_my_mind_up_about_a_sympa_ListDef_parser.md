% make my mind up about a sympa ListDef parser

within few days, i'll write a REST service to
[CRUD](http://en.wikipedia.org/wiki/Create,_read,_update_and_delete) the 
[sympa list defs](https://www.sympa.org/manual_6.3/list-definition#list_configuration_file). 

I will not use the parser from the sympa code because:

* i don't want sympa to be a a software dependency: there is no need 
* i want to be able to extend the format without editing the sympa code

i'll probably push this parser on [CPAN](http://metacpan.org) but for now,
[TIMTOWTDI](http://en.wikipedia.org/wiki/There%27s_more_than_one_way_to_do_it) and i consider 3 of those:

* wrap roughly copy/paste from the sympa code
* use pegex
* write my incremental m//cxmsg parser (i still don't understand if it's bottom/up or top/down :))

all with pros and cons. 

## copy/paste

would be harder to maintain (the current code is a cargo cult parsing in a
while loop) but every improvement can be contributed back to sympa.

## Pegex

pegex grammars are very simple to maintain and read which could be usable in 
other languages (i haven't tested yet but javascript could be an example). It
would add a dependency to Pegex but i really don't think it's a cons argument
in 2014.

## incremental m//cxmsg parser

as i'm used to it, i think i can provide simple, extensible and readble code
following this way but is it worth to do it just to avoid the Pegex dependency?
does Pegex add an runtime overload ? 
