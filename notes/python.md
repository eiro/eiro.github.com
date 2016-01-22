python to compete with perl 
* shift, unshift, pop, push

weird python

	x=12
	point("origin",x=0)

but yet

	point(x=0,"origin")

is invalid
	div(class="button__pressed","test")   # BANG! class is a reserved word
	div('class'="button__pressed","test") # BANG! because fuck you! 

is quiet ugly to read and write
* implicit return
* split lines for readability
  * line continuation introduced by operator? what about unaries
  * indent! because they all know about indenting now 

# python survival kit for mongers

moving from [Perl](http://www.perl.org) or [Ruby](https://www.ruby-lang.org/)
to [Python](http://www.python.org) is like getting your hand cut off: that's
not confortable at all ... but live goes on.

on the other hand: python on its ecosystem gets better and better, running
after perl the right way so be sure you are ready

## What you need

### A positive attitude

#### With the code

Try to be idomatic. In many ways, Perl is a child of lisp when python comes
from C++. If you accept that and try to think the Python way, you'll be
rewarded by a code that is sometimes more elegant that the Perl version.

Read the
[PEP 0008 -- Style Guide for Python Code](https://www.python.org/dev/peps/pep-0008/)

#### With the community

Don't be frontal with the Python community


and don't reply to arrogance with
arrogance. Most of the 

* Don't introduce yourself as a Perl monger.

* For most of the members of the Python community, 





because frankly, most of them 
  are hermetics to your vision of elegance 

    * don't troll the python community: most of its members will
      just reject your arguments (some misconceptions about Perl are hilarious: just give it away)
    * when something is missing in the core, can you write a module?

# python tricks for mongers

## the dogballs inferno

Python has a very curious way


* the very last version of python (for code sake, )



so be sure you're using the very last stable version
of python and check those docs

* [https://docs.python.org/3.5/whatsnew/3.5.html#whatsnew-pep-448](https://www.python.org/dev/peps/pep-0448/)
* []

## tools

|Perl|Python|
|-:|:-|
|[Dist::Zilla](https://metacpan.org/pod/Dist::Zilla)|[flit]()|

http://perlgeek.de/blog-en/automating-deployments/2016-004-debian-packaging.html
https://github.com/lihaoyi/macropy
http://perlgeek.de/blog-en/automating-deployments/2016-003-simplistic-deployment-git-pull.html
http://dh-virtualenv.readthedocs.org/en/0.10/usage.html
