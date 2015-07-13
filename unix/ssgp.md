% scripting good practices

there are a lot of cases when shell scripts can be easier to write and maintain
than a perl/python/ruby counterpart (when dealing with system commands, simple
paralelization, simple text filtering). Unfortunatly, shell scripting suffers
from a lack of consideration and is blamed for unreadability when the one who
actually wrote the script is the right one to blame.

those are my tips to make your shell scripts better, HTH.

# Global stragegy

## read articles on KISS principles and the unix philosophy

[cat-v](http://cat-v.org/) has a very well currated collection of links and
papers about it. Also, Rob Pike's talk on this subject are really inspiring.

## Choose your shell

* if memory is a critical ressource, use mksh or rc
* in all other situations, use zsh! 
* "this shell is not the default one" is really not an excuse. frankly: do you
  only use tools provided by default on your system? of course not! The shell
  is something you'll use every day and you better choose a good one

I didn't mention bash, dash or any member or the csh familly because i think
there is no point using them as another thing as a fallback.


## Don't take portability too seriously

    "this is easier to port a shell than to port a shell script"

Larry Wall is so right on that! As shell interpreters and other softwares of
the toolchain doesn't complain so much when something is going wrong, portable
shell scripting is the hell to write *and* debug. please don't.

So choose a target architecture and stick with it! If you really need something 
portable, write in [perl](http://www.perl.org).

You still want to try? You fool! So choose a portable complete portable
toolchain (9base for exemple) and stick with it on all the systems. yet will
have to write and maintain wrappers around platform specific system
administration tools and path ... but after all: you're a gambler.

you could also have a look on [m4sh](http://www.gnu.org/software/autoconf/manual/autoconf-2.66/html_node/Programming-in-M4sh.html) :). 

# Coding Style

## Be sure there is no command to read your data

A typical example of it is querying `/etc/passwd` to get infos on a user. the
very first guess will be wrong: 

    grep $1 /etc/passwd

later you'll fix

    sed -n "/^$1:/{
        p
        q
    }" /etc/passwd

But a bug remains: if your system uses LDAP via NSS, the john entry could be in
a completly different place and your script will wrongly returns nothing.

So please read the documentation of your system and you'll find `getent`

    getent john passswd

was the good answer (on a linux box). 

## use long version of the flags (mostly)

when you needed the man to find a flag, prefer the long version of it (when
they are available) because in 6 months, when you'll have to change something,
--use-compression` will be much more readable than `-c`.

## Code aeration

use every occasion to add spaces and line returns (like pipes and quoted subscripts)

        getent passwd | cut -f1,7 -d: | grep zsh

is much readable like this

        getent passwd     |
            cut -f1,7 -d: |
            grep zsh

the awk version

        getent passwd | awk -F: -vlogin=1 -vshell=7 '$shell ~ /zsh/ { print $login }'

should be written as

        getent passwd |
            awk -F: -vlogin=1 -vshell=7 '
                $shell ~ /zsh/ { print $login }
            '
you can also use line returns when using subshells

    translate <(
        my_computation |
            my_filter
    )

    need $(
        my_computation |
            my_filter
    )


## name things when you can

### your filters and generators

    while ((n++)) {
        echo $n
    } |
        sed -n '/[02468]$/' |
        sed 5q 

will take you an effort to read while 

    nat | keep_evens | sed 5q 

will not. please write 

    nat () {
        local n=${1:-1}
        while ((n++)) {echo $n}
    }

    keep_evens () { sed -n '/[02468]$/' }

but regexps are not the only thing to hide, uncommon expressions like 

    IFS=$'\n' read -d '' -A $1

should be wrapped in a function 

    slurp    () { IFS=$'\n' read -d '' -A $1 }

### your fields (using awk)

    awk -F: '$7 ~ /zsh$/ { print $1 }'

* gives you no clue on the data you're reading
* will be hard to maintain if the column order are modified

so use the -v flag instead

    awk -vlogin=1 -v shell=7 -F: '
        $shell ~ /zsh$/ { print $login }
    '

### your arguments

    print -- $1 if [[ -d $1 ]]
    local dir=$1

## avoid interpolation as far as you can

* when using awk, use -v
* when using perl, use -ws

## take avantage of the filters you use

keep in mind that every | introduce 2 forks and subprocesses will use read and
write to communicate. So unless you hide filters on wrapped functions, please
don't write things like 

    cat foo |
        cut -d: -f1 |
        grep -vF -- - |
        awk '{i+=$1} END { print i}'

Because as you use awk in the process, you can ask it much more (if you spent
some time to learn the basics). 

    awk -F: -v x=1 '
        $x > -1 { n++ }
        END { print n }
    '

## Comment *and* document

use `:` to introduce a perlpod (man `perlpod`) section

    : <<=cut

    =head1 your documentation

    =over

    =item *

    with lists

    =item *

    with sections

    =head1 credits there

    thanks for reading

    =cut

    # your script starts there

    echo "hello world"

now you can use `perldoc myfile` to read the doc as a man or render html or pdf
documentation.

## test your functions

there are some TAP generators for zsh outthere like knock or devel/TAP: use
them as you would use them when writting code in other languages. 

## Use modern features of your shell

don't let your shell define global variables into functions or use unset values/

    setopt warncreateglobal nounset

use brace expansions and extended globs 

    setopt extendedglob braceccl

## when writting libraries, use namespaces

redefining a command will success silently. to avoid stupid bugs using this
"feature", use namespaces. so that

    . mathlib

would provide `  

    mathlib/seq 

not

    seq

# use localoptions

when you setopt something in the function, the setting is global so you'll
change the behavior of all your script, introducing some weird bugs. 

    f () {
        setopt xtrace
        echo hello world
    } 
    echo still xtracing now ...

the options can be set for your function only

    f () {
        setopt localoptions xtrace
        echo hello world
    } 
    echo no more xtrace here

# use errexit or erreturn make your script stops at the first error 

instead of writing

    foo || exit
    bar || exit
    can_fail
    bang || exit

setopt errexit so you can write 

    foo 
    bar 
    can_fail || true 
    bang 

same with return

# preserve and use the return value

the last command executed by a function returns a value (stored in `$?`)
which could be used by your caller

    sanity () {
        grep -q root /etc/passwd
    }

    sanity || echo "no more root on your system?"

    we_dont_care () {
        grep root /etc/passwd
        true
    }

    we_dont_care || echo "this is never called :)"

be aware that 0 (as 0 error) is true and the rest (1 to 255) is false. so you
can write your own version of true: so you 

    true () { return 0 }
    false () { return 1 }

# use true and false for booleans

instead of writing

    enable_compression=1
    (( enable_compression == 1 )) && print "content will be gzipped" 

use the interpolation of true/false

    enable_compression=true
    $enable_compression && print "content will be gzipped" 


# iterate on globs, not command outputs 

    for f ($(ls *)) print $f 

translate the output of ls into barewords (according IFS), not filenames! please use 

    for f (*) print $f



