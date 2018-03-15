%

# Why choosing another langage

Perl will remains as my langage programming of choice when it come to write
scripts to get things done: i really think there is no decent competitor on
this part of the spectrum. Yes i tried ruby, python, javascript,
lua, moonscript, livescript (please let me know if i missed a very good one) ...
and none of them took advantage over perl when you see it at large (i mean:
considering the whole ecosystem, the quality of the CPAN tools, the sanity of
its community). Rakudo will be a successor in some years: the langage is awesome
but for now, the ecosystem lack of maturity doesn't fit my egoist requirement
(it should work without patching or spending time to figure out how to use it).

i want to add guile at some point. (TODO: say why)

However: since circa 2007, new langages showed up with very interesting features
available only on dynamic langages since then. the new thing is that they are
strongly typed and can be compiled and this fix a lot of problems (like
performance, memory consumption, dependencies deployment , ...).

we started hearing about go, julia, nim, haskell, rust and more recently crystal.
I read about them, played with some others and got finally 3 candidates i
now try to compare.

* rust seems to be the one with the best promises about performances as well as
  memory consumption. however, it is the one i find hard to reason about for
  the moment. also it can be embedded in our beloved scripting langages and
  can embed as well (c code for exemple). it is supported by the mofo and
  is now used on large projects. i don't worry about its future.
  cargo, the build system, is very pleasant to use. and i saw very elegant
  things built on the macro system.
* haskell ... i love it as long as the problem is simple but i have to admit
  larger codebases scared me a lot (the pandoc one for exemple). the community
  is large and the langage is founded by academic labs as well as some healthy
  companies.
* crystal is like a ruby made right and compiled. Code is written really easily.
  i have to play more with ecosystem tools but it seems it works fine.
  the thing that worries me a lot is there is no big supporter behind it. as
  far as i read, just few people supported by donations. not only it's scarry for
  the future but right now, some very interesting features of rust are still in the
  roadmap of crystal.

current state of mind:

* go on playing with all of them
* give go another try? after all: lot of things probably happened in 8 years.



