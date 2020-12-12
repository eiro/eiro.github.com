# mongers classic (and so frustrating) python mistakes

* python don't warn when returning something in the void context
* the 'return' keyword is required to return something
* bare words don't call, they return fonction references

so those valid python lines are just all traps for perl mongers

    def add(x,y): x + y
    print(add(3,4))
    # just prints 'None'

compiles but just prints `None`. Fix this:

    def add(x,y): return x + y
    print(add(3,4))

and this one don't even print something

    def hello(): print("hello world")
    hello

this is ironic for someone who comes from a langage with so many lisp
inspirations but you need to get lost in stupid parentheses. python just helps
you to get lost faster because of the places of the parentheses:

    def hello(): print("hello world")
    hello()

when perl is that cool with parentheses:

    sub hello ()        { say "hello world" }
    sub add   ($x , $y) { $x + $y }
    hello;    # perl way
    hello();  # python way
    (hello);  # lisp way
    say add 1, 3;
    say(add(1,3));
    (say (add 1, 3));
    say (add 1, 3);
    say add(1, 3);

how about this one?

    add(add(1,2),add(3,5));

you probably want to write

    add (add 1,2), (add 3,5);

but it doesn't work because it's actually

    (add(add 1,2)), (add 3,5);

you can use unary + to explicit the first term so those ones are ok:

    add +(add 1,2), +(add 3,5);
    add +(add 1,2), (add 3,5);
    add +(add 1,2), add 3,5;

so

    @doubles = map $_ + 4      , 5..8;
    @twice   = map +( $_ , $_ ), 5..8;

also: perl makes you free about indenting and spliting expressions
on multiple lines: use it.

    (add
        +(add 3, 4)
        +(add
            +add(add 4,5),
            +add(add 2,6)))

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

Don't be frontal with the Python community: they are pretty sure they use the
best language ever designed so don't express yourself in terms of something you
prefer in other languages.

so when you actually have in mind

> this perl feature really ease my life, is there something at least close in python?

and just write it that way, you'll feed your box with a lot of useless and
condescendant answers and some "perl is dead" bullshit.

asking this way would raise much more constructive mindset:

> python is so awesome i wonder if i can do things this way or if there is another
> awesome pythonic way to get those super python power.

Also: don't introduce yourself as a Perl monger or other langage fan: if you're
stupid enough to prefer another langage but python, you don't deserve attention
from them and frankly: most of them are hermetic to your vision of elegance.

If any of them finds out you're a perl monger: don't troll: most of them will
just reject your arguments (some misconceptions about Perl are hilarious: just
give it away. about that:
if you want to see the stupidest conference ever made about perl,
watch "[The Perl Jam: Exploiting a 20 Year-old Vulnerability](https://media.ccc.de/v/31c3_-_6243_-_en_-_saal_1_-_201412292200_-_the_perl_jam_exploiting_a_20_year-old_vulnerability_-_netanel_rubin)".  i never saw anyone bragging with *that* level of ignorance).

Of course: there are exceptions and some people in the python community are
both technically impressive and very nice persons. some of my very dearest friends
are members of this community.

# ARGV

not built-in but it could be a module to provide a context.

# PEPs that can save your life

some python coding styles are very python2 inspired but if you use the last versions
of python, you'll be happy to know that those PEP exist:

* [https://docs.python.org/3.5/whatsnew/3.5.html#whatsnew-pep-448](https://www.python.org/dev/peps/pep-0448/)
* TODO: the others (can't find them right now. including `:=`)

## tools

|Perl|Python|
|-:|:-|
|[Dist::Zilla](https://metacpan.org/pod/Dist::Zilla)|[flit]()|
|cpanm|pip|
|carton|pip?|
|dh-make-perl|[dh-virtualenv](http://dh-virtualenv.readthedocs.org/en/0.10/usage.html)?|

