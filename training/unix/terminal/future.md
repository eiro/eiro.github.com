
# globs et regexps 

* anatomie d'une commande

    * print vs print -l 
    * barewords séparés par des IFS
    * `\` permet de protéger
    * print -l  

    print -l -kilo-
    print -l -- -kilo-
    print -l -- -kilo-

print ~

print {a-c}x{d-f}
axd axe axf bxd bxe bxf cxd cxe cxf

print prénoms français: \
Jean-{Marie,Pierre,Luc,André,Paul} 
print prénoms français: {,Jean-}{Marie,Pierre,Luc,André,Paul}

print -l prénoms\ français: {,Jean-}{Marie,Pierre,Luc,André,Paul}
print -l "prénoms français:" {,Jean-}{Marie,Pierre,Luc,André,Paul}

my% t
l ${(s::):-"this is a test"}
print {a-z} | sed -nr '
    : loop
    p
    s/(.) (.*)/\2 \1/
    /^a/q
    b loop
'

# basic .zshrc

alias l='print -l'

my% t
echo this:is:a:test | IFS=: read t\[{a,b}] _
print $t[b]

x=34 sh -c 'echo $x'
print $x

x=34
sh -c 'echo $x'
print $x

export x=34
sh -c 'echo $x'
print $x 

soit le fichier intro.md qui contient des diapositives au format markdown. 
toutes les diapositives avant "Unix" doivent devenir un markdown séparé. 

:r /etc/passwd
:w users
:1,5w! users
:w !cat
:%g/zsh/ w zshusers
:%!:
:r zshusers


:r !man dash
:%!





\v\c<[bt]

sed '$i
.' foo > bar 

seq 3 > foo 


sed '$i
' foo > bar 

{cat makefile; echo } | sed -n '/^bar:/,/^[^\t]/p'  | sed '1d;$d;s/^\t//'  


foo:  bar bang
	x=foo
	print $bar

bar:
	x=hehe
	echo enter


find, les redirections, les pipes


seq 99 | tac | awk '
    { print $1" bottles of beer on the wall, 15 bottles of beer.\n"\
    "Take one down and pass it around,"$1-1" bottles of beer on the wall."}
' 

{ column -ts '#' | sed 's/ [^ ]/ #&/' } <<< '234234#ZERZRZERZERZERRZERRRZER#ZERZR
234242342342#ZZEREZR#ZERZR' 

make replacements

digraph "make flavors" { "AT&T" -> { "GNU make", pmake, "*BSD make", mk } }
digraph "make flavors" { "AT&T" -> { "GNU make", pmake, "*BSD make", mk } }

http://gittup.org/tup/
https://www.freebsd.org/doc/en/books/pmake/ 
https://en.wikipedia.org/wiki/List_of_build_automation_software 
http://shakebuild.com/manual

ant, maven, lein, grunt, rake, ... et des dizaines d'autres

for t (t/*zsh) {zsh $t > ${t%zsh}tap}
tapprouve t/*tap > t/repport.html
for f (*JPG) mv $f ${(L)f}

# MATCHES_PICS='*.(#i)(JPE#G|PNG|SVG)'; ls $~MATCHES_PICS

'<,'>s##$old#cg


# aide en ligne

apropos
man



