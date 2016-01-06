
# truth

    false && 
    truth  () { return 42 }
    oracle () { truth; return }
    oracle
    print $? 

# structures de controle

* if, for, while, case (`ksh`)
* repeat (`zsh`)

# exemples

    s="this is cool"
    for w in $s; do
        echo $w
    done 

s=( 'this is' a test )
for w in "${s[@]}"; do
    echo $w
done

`man mksh` (section Parameters)

foo=( 'this is' a test )
bar=( ok ok )
big=( $bar $foo )
echo ${#big[@]}
big=( ${bar[@]} ${foo[@]} ) 
echo ${#big[@]}

t="this is good"

# la séquence robustesse (dans les scripts)

* quoter
* utiliser `setopt nounset`
* utiliser `--` quand print affiche une variable

~~~{.zsh}
    setopt nounset
    x=-kilo-
    print -- "$x"
~~~~

$~ et $^

braceccl
extendedglob
nohashdirs
pathdirs
shinstdin
nounset
warncreateglobal

print -f '%0*d %s' 5 23 deux  
print -f '%05d %s' 23 deux  

# programming 

||||
|-|-|-|
| echo   | hello | world |
| `$0`   | `$1`  | `$2`  |



