# make my mind up about a sympa ListDef parser
<a href="mailto:blog-comment-experiment@u-strasbg.fr?In-Reply-To=%3CmakemymindupaboutasympaListDefparser@eiro.github.io%3E&Subject=Re:%20my%20mind%20up%20about%20a%20sympa%20ListDef%20parser">Comment</a>\n<p class="date"> 2014-03-19T11:12:11+01:00</p>

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


## Path 2) incrémental //g parser

Pro:

* no CPAN dependency (very poor argument, i admit it)
* more hackable? 

Cons:

* very simple to maintain 
* available in pegex supported targets (including javascript)


# eiro-brain-dump to please ironman
<a href="mailto:blog-comment-experiment@u-strasbg.fr?In-Reply-To=%3Ceirobraindumptopleaseironman@eiro.github.io%3E&Subject=Re:%20to%20please%20ironman">Comment</a>\n<p class="date"> 2014-03-19T10:53:31+01:00</p>

some days ago, i had a chat on [epo](http://www.enlightenedperl.org/)@[freenode](http://freenode.net/)
because [my atom](/atom.xml) is completly ignored by [ironman planet](http://ironman.enlightenedperl.org/).
this post is a reminder.

[Ironman planet](http://ironman.enlightenedperl.org/) expects each entries to provide
an alternate html address (which wasn't my initial plan but after all: every text
can be rendered as html).

So the plan is 

* fix [eiro-brain-dump](http://eiro.github.io) to make it ironman compliant (i still have to decide how). 
* install a local ironman and provide a patch to show error reports when you update your feed
  (so you can fix your stuff without disturbing EPO people)

this was an excuse create a profile on [questhub.io](https://questhub.io/)
and create a [related quest](https://questhub.io/realm/perl/quest/531f0d326e78176e6a0000bd). 

# sympa to comment blog posts: how?
<a href="mailto:blog-comment-experiment@u-strasbg.fr?In-Reply-To=%3Csympatocommentblogpostshow@eiro.github.io%3E&Subject=Re:%20to%20comment%20blog%20posts:%20how?">Comment</a>\n<p class="date"> 2014-03-06T22:37:09+01:00</p>

I explained [why](http://eiro.github.io/news.html#sympa-to-comment-blog-posts-why) 
i want to use sympa to manage comments. this is the "how" (as an experiment)

## create a blogcomment scenario

the idea of this scenario is you can publish in 2 cases: 

* you are a member of the list
* you're commenting a blog post

so my `/etc/sympa/scenari/send.blogcomment` file is 

    title.gettext Blogpost comment
    title.fr Blogpost Comment

    match([msg_header->X-Spam-Status], /^YES/)            smtp,smime,md5  -> reject,quiet 
    match([msg_header->In-Reply-To], /eiro.github.io/)    smtp,smime,md5  -> do_it
    match([msg_header->In-Reply-To], /blog/)              smtp,smime,md5  -> do_it
    is_subscriber([listname],[sender])                    smtp,smime,md5  -> do_it
    true()                                                smtp,smime,md5  -> reject,quiet  

now the list itself is configured to use the blogcomment scenario. which means that you
must have this in in the list root

     grep '^send' config
     send blogcomment

## create posts from your webpage 

what you need is add an mailto: URL with 

* the subject of the post as subject
* a `Reply-To` header to please the `blogcomment` scenario

i use [this simple script](add_comment_links.pl) in combination with
[atombomb](https://github.com/eiro/app-atombomb) to achieve that on this site. 

# 7 habitudes pour editer du texte éfficacement
<a href="mailto:blog-comment-experiment@u-strasbg.fr?In-Reply-To=%3C7habitudespourediterdutextefficacement@eiro.github.io%3E&Subject=Re:%20habitudes%20pour%20editer%20du%20texte%20%C3%83%C2%A9fficacement">Comment</a>\n<p class="date"> 2014-03-05T10:58:35+01:00</p>

Nouvelle version de la conférence de [Bram
Moolenaar](http://fr.wikipedia.org/wiki/Bram_Moolenaar),
"[7 Habits For Effective Text Editing 2.0](https://www.youtube.com/watch?v=p6K4iIMlouI)"
est sur youtube. C'est méthodologique plus que technique. Très intéressant! 

je traduis une [diapo importante](https://www.youtube.com/watch?v=p6K4iIMlouI#t=2274).

* étape 1: détecter les pratiques inéfficaces, rébarbatives
  (identifier les moments ou vous perdez du temps)
* étape 2: trouver plus rapide (alternatives en cas d'échec)
  * chercher dans l'aide en ligne 
  * chercher dans les quick refs, cookbooks, archives des listes, … 
  * demander à vos amis, vos collègues
  * chercher sur internet
  * faites le vous-même
* étape 2: faites-en une habitude
  * faites-le
  * continuer à l'améliorer

j'aurais tendance à ajouter:

* gitez votre conf. et n'hésitez pas a virer ce qui ne vous sert plus (au pire
  vous piocherais dans l'historique).
* ne pas chercher à améliorer les choses plus de 10mn (y revenir plus tard avec
  des idées fraiches est souvent bien plus éfficace).
* accepter les imperfections
  * meme si vous savez que votre macro/habitude ne traite pas tous les cas, utilisez-la.
  * ne tentez pas de l'améliorer avant de tomber *régulièrement* sur des cas pourris.

# sympa to comment blog posts: why ?
<a href="mailto:blog-comment-experiment@u-strasbg.fr?In-Reply-To=%3Csympatocommentblogpostswhy@eiro.github.io%3E&Subject=Re:%20to%20comment%20blog%20posts:%20why%20?">Comment</a>\n<p class="date"> 2014-02-25T13:22:40+01:00</p>

I maintain websites since 1997 and my motto always was "as static as possible".
I run my own "static web" engines, used open source ones and ended with
[a simple `Makefile`](#adieu-jekyll-i-dumped-you-for-a-28-lines-makefile).

The very important missing part was blog comments but it's not only about
serving static pages: we're in year 2014 and still, the web failed to provide
tools that can approach the productivity of mutt when it comes to share
thoughts about a post: editing in textareas, navigating in the thread, tagging,
archiving, ... all those basics are just jokes in a webpages! Trying to compare
wikis to just editing files in your filesystem (then share them with git,
rsync, seafile, whatever ..) also is. 

But i didn't carre for a while because i had a bigger plan (my beloved
`mindpipe`) so asked commenters to send me mails instead of expecting a
"comment" textarea. I miss [usenet](http://en.wikipedia.org/wiki/Usenet). 

Years ago, i came at a [French Perl Workshop](http://journeesperl.fr/) and
spoke about a subset of what mindpipe could be. Then i learnt (thanks to
[BooK](http://philippe.bruhat.net/) and [Franck](http://lumberjaph.net/)) about 
[disqus](http://disqus.com/). i also was aware of [gname](http://gmane.org/).

Finally, i'm now convinced that the technical roots of mindpipe was invented in
a 80's OS named [Plan9](http://en.wikipedia.org/wiki/Plan_9_from_Bell_Labs).
What i want is just piping, copying and editing
[9p](http://en.wikipedia.org/wiki/9P) served files thru [vim](http://www.vim.org),
[acme](http://en.wikipedia.org/wiki/Acme_(editor))) or emacs.

I know web browsers are bloated enough to serve as a base of very handy editing
application (cloud9 or etherpad are some moving tries to render edited content
in a web page) but they need a 9p support (maybe
[servo](https://github.com/mozilla/servo/) could have one?) and i think plan9
ideas are finally spreading (i remember how sarcatic were people about linux or
open source just ten years ago, they just heard about it).

Nevertheless: ten years later, mindpipe is still just an idea and i changed my
mind about doing software. I really think that

* nothing is perfect
* starting small is better than not starting at all
* the best code is the one you don't have to write

thinking the unix way: what is the best tool to provide simple ways to

* subscribe a discutions that can be seen as emails? 
* make discutions and archives public, private, moderated?
* avoid spams and robots using bayesians and sending scenaries
  to check the validity of your posts?

I i need a battle tested, highly configurable and extendable but just a
"mailing list manager"! I know it's not perfect but it's way better than
running yet another anoying web forum.

And i know the beast: [sympa](http://www.sympa.org) is way the best mailing
list manager i ever seen. Yes, i have tons of grievances about it but in the
end, it's much more superior than everything i saw and is in a constant
evolution since 1996 (AFAIK). Plus: it's written in
[Perl](http://www.perl.org)! not a so modern one but you don't carre if you
just have to write plugins.

# FOSDEM sequel: C++11, scrum, ...
<a href="mailto:blog-comment-experiment@u-strasbg.fr?In-Reply-To=%3CFOSDEMsequelC11scrum@eiro.github.io%3E&Subject=Re:%20sequel:%20C++11,%20scrum,%20...">Comment</a>\n<p class="date"> 2014-02-15T11:55:23+01:00</p>

Once again, i came to [FOSDEM](https://fosdem.org/2014/) with some talks in
mind, missed them and learnt a lot of new, completly different things.

Once again, FOSDEM is the echo of my internet feeds (at this point, the cultural spectrum 
of the people i spoke to is too large to just say we're reading the same blogs).

* the rise of the functionnal programming for the masses 
* the rise of the "let's fire all managers" movement (coming from both
  scrum and open source as "working models")

The big surprise for me is a very interesting discution about the modern paradigms of C++.
I realized i was acting like the "perl is dead" people: comparing C++ from nineties to the 
very last features of the langages i use daily: I was not unfair, just ignorant.

So i began to read the C++ posts again and seen
[this article](http://nathan.ca/2014/02/type-rich-programming/) pointing on 
[Bjarne Stroustrup: C++11 Style](http://channel9.msdn.com/Events/GoingNative/GoingNative-2012/Keynote-Bjarne-Stroustrup-Cpp11-Style) 
which is a very interesting talk about what the "good C++" should be.

# adieu, Jekyll (i dumped you for a 28 lines Makefile)
<a href="mailto:blog-comment-experiment@u-strasbg.fr?In-Reply-To=%3CadieuJekyllidumpedyoufora28linesMakefile@eiro.github.io%3E&Subject=Re:%20Jekyll%20(i%20dumped%20you%20for%20a%2028%20lines%20Makefile)">Comment</a>\n<p class="date"> 2014-01-31T10:15:57+01:00</p>

Months ago, and once again, i spent hours to figure out how to do things i
expected to be simple. In this case, Jekyll isn't the one to blame: the ruby
ecosystem is.  I'm a happy [CPAN](https://metacpan.org/) user and contributor
as well as [cabal](http://www.haskell.org/cabal/) happy user. Coming from those
world, the ruby one is quiet messy.

So i decided to throw all the blog/wiki engines away, running a temporary
solution with the simplest bootstrap i can write. Following the rules of the
unix [KISS principles](http://en.wikipedia.org/wiki/KISS_principle), i divided
the "CMS" problem more little ones. I needed something as simple as possible to
extend coming with: 

* a content generator
* a conductor to drive it
* a responsive design
* a web browsable SCM 
* an atom generator
* a discus-like comment system

so i choose the simplest (or best) tools i know for each task:

* [pandoc](http://johnmacfarlane.net/pandoc/) to generate html content from md files.
  I don't know about the internals but both the CLI tool and the haskell API are very pleasant
  to use. 
* [make](http://pubs.opengroup.org/onlinepubs/000095399/utilities/make.html) is
  my conductor. As i really expect the every so-called unix users have the
  basics of make. It get the job done for many decades now. I also have a look on 
  mk from [the 9base](http://tools.suckless.org/9base). 
* [git](https://git.wiki.kernel.org) as SCM, lot of tools out there to browse it from the web.
* [Unsemanic CSS framework](http://unsemantic.com/). I don't know a lot about
  web development but i was aware about
  [Responsive web design](http://en.wikipedia.org/wiki/Responsive_web_design)
  and saw the ancestor of unsemantic was in the roadmap of 
  [werc](http://werc.cat-v.org/) (when it comes to simplicity, you really can trust the 
  [cat-v](http://cat-v.org/) Ayatollahs^wpeople)
* more recently, i wrote [atombomb](https://github.com/eiro/app-atombomb) to add
  atom feeds to some sites.

so the workflow is:

* create a new md for a new page
* manually maintain the atom feed (
  [atombomb format](https://github.com/eiro/eiro.github.com/blob/master/Makefile)
  is quiet helpfull for this part)
* run make to build a section
* git submodules to add subsection
* rsync or git to push on the server

you can see all the revision by using a git browser (like the github one) and i
plan to use an ajax call the powerfull [sympa list manager](http://sympa.org)
to run a discus-like comment system.

Months passed and it became clear i will not step back: those 62 LOC (it takes
less than 5 minutes to understand the whole thing) never desapointed me. 

* the publishing process is faster and easier
  * i use the :make command of vim
  * my working directory is served by a local http server
  * everything is relative to the working directory:
    if it renders well here, it will render well offline. 
faster and easier local preview before pushing
* so easy to extend i never was stuck by a new problem, i just had to write
  some few extra lines in the Makefile to get new features like
  * [graphviz](http://www.graphviz.org/) and [ditaa](http://ditaa.sourceforge.net/)) support
  * beamer slides (using the theme of my university).
  * render html report from external sources (just use pandoc md as
    intermediate representation and run make)

Actually, even my todolist/notes system is now based on it (in combination with
vim and mutt i'll explain in another post) and as always, i realized how happy i am when i 
follow the rules of the unix [KISS principles](http://en.wikipedia.org/wiki/KISS_principle). 

<pre>
    # wc -l M* t* 
      28 [Makefile](https://github.com/eiro/eiro.github.com/blob/master/Makefile)
      27 [template.html5](https://github.com/eiro/eiro.github.com/blob/master/template.html5)
       7 theme.css
      62 total
</pre>

the only thing i was afraid was "all is relative to the working directory"
thing: i copy the css files for each new section. suprisingly, it has benefic
effects. 

* i think twice before adding a section and it keep me aware of the content. 
* the local CSS actually import a stylesheet shared by all the sites i manage so i can easily  
  maintain the whole stuff.

So another unix principle is at work here: "Premature optimization is the root
of all evil". Thanks Donald!

# atom bomb first test
<a href="mailto:blog-comment-experiment@u-strasbg.fr?In-Reply-To=%3Catombombfirsttest@eiro.github.io%3E&Subject=Re:%20bomb%20first%20test">Comment</a>\n<p class="date"> 2014-01-18T22:08:52+01:00</p>

i decided to push a repository on github with all those tests and notes that
can maybe become a project some day and named it
[labo](https://github.com/eiro/labo/).

this feed is generated with 
[atom bomb](https://github.com/eiro/app-atombomb) and the
[feed file](https://github.com/eiro/app-atombomb/blob/master/t/feed) i just maintain
manually with vim and [simple zsh helper](https://github.com/eiro/uze/blob/master/atombomb)
to create headers.

atom bomb (i'm not sure about the name) is written in
[perl5](http://www.perl.org/) and
[Eirotic.pm](https://metacpan.org/pod/release/MARCC/eirotic-0.0/lib/Eirotic.pm) which
replace my common boilerplate:

* [Perlude](https://metacpan.org/release/perlude)
* [Method::Signatures](https://metacpan.org/pod/Method::Signatures)
* perl 5.14 with strictures
* YAML

markdown conversion is made by [pandoc](http://johnmacfarlane.net/pandoc/). 

# new (experimental) atom feed
<a href="mailto:blog-comment-experiment@u-strasbg.fr?In-Reply-To=%3Cnewexperimentalatomfeed@eiro.github.io%3E&Subject=Re:%20(experimental)%20atom%20feed">Comment</a>\n<p class="date"> 2014-01-17T13:24:08+01:00</p>

few months ago, i decided to experiment
[make](http://pubs.opengroup.org/onlinepubs/009695399/utilities/make.html) and
[pandoc](http://johnmacfarlane.net/pandoc/) and [git](http://git-scm.com/)
as a minimalistic blog/wiki engine ([werc](http://werc.cat-v.org/) was on my
list too) to replace jekyll (i was a fan of ruby until i tried it).

now i'm totally happy with the basics and i need to extend:

* comment posts via sending an email to the list
* see comments by viewing archives
* a simple way to maintain feeds. i wrote a little perl script to test it


