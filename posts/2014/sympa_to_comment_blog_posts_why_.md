% sympa to comment blog posts: why ? 

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
