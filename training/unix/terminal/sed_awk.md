
alias c='cut -d: -f'
alias uid_sort='sort -t: -k2'
alias uid_join='join --nocheck-order -t: -1 1 -2 2'

getent passwd |
    c 1,3,7   |
    uid_sort  > db

c 2,3 db     |
    grep zsh |
    c 1      |
    sort     > uids

uid_join uids db

eval 'set hello "this is" good'
this is

print -l  "${(@)j}"

sed -rn '
    s/^(.*):(.*):(.*zsh.*)/\2:\1:\3/p
' db

sort -f2 -t:

