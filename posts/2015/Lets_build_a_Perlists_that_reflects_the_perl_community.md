# Let's build a Perlists that reflects the perl community

Perl is our community and i would like
[Perlists](https://groups.perlists.pm/sympa) to reflect it. I [recently
presented](eiro.github.io/posts/2015/Host_your_perl_project_on_perlists_en_.html)
the new shiny [perlists platform] and hope a lot of perl mongers around the
world will benefit from it. To make things more attractive, we still have some
work: 

First, we have find and fix all the rendering bugs of the new interface
(i suspect there are lot of them hidden in the corner)
so feedbacks and wishlists are very welcomed, please write to 
[us](mailto:listmaster@groups.perlists.pm).

We also need to "shape" the site to fit your needs. David built a geographical
herarchy which is great for the perl monger groups but i also would like
something like a "project pack": when you declare a project "foo", it will
automatically

* creates and gives you ownership yo foo, foo-devel, foo-users and foo-announce. 
* include foo-devel, foo-users and foo-announces in foo.

We need more features, more ideas and any suggestion of any kind would be 
considered by the [listmasters](mailto:listmaster@groups.perlists.pm). i can
share mine: 

I did a simple experiment to use sympa as a comment platform ("à la"
[disqus](https://disqus.com/about/)).

* If you click on "comment the post", you actually send a mail
  to a mailing list.
* If you click on "see comments", you actually go to the archives page
  (i expect something more "ajaxy" on the future).  

I also would like more interactions
with the [metacpan](http://metacpan.org) ecosystem. For example: a
[https://metacpan.org/pod/Dist::Zilla][dzil] plugin to post on "foo-announce"
when i `dzil release` a new version of foo.

i hope to read from you.
