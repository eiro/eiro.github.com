typeset -A user
user=(
    login       mc
    displayName "Marc Chantreux"
    role        formateur,respapp
    service     unistra/di/sm/ssm
) 




x="$( expr 1 + 2 )" 
# list="$( seq 10 )"
# echo "$list"
list=($(seq 10))
print -l $list
users=( za wj "f dehan" dm mc fe )
{ print -l haha mdr ptdr
    for u ($users) {
        echo $u
        echo est cool
    }
} 


