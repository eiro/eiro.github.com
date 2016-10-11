
reduce_pure_shell () {
    local op=${1?an operator as first argument} r=${2?at least one value}
    shift 2
    while test ${1-}; do
        r=$(( r $op $1 ))
        shift
    done
    echo $r
}

reduce_with_sed () {
    local op=$1
    shift
    echo $(($( echo "$*" | sed "s# \+#$op#g" )))

}

. ./tap.sh
export it
alias @='for it in'
@ ok prove note; do alias $it=tap_$it
done

expectation () {
    test $got -eq $expected
    ok "using $it, $1" ||
        note "got $got while $expected expected" ;
}

i_can_reduce () {

    local r
    tap_plan $(( 4 * 2 ))

    @ reduce_with_sed reduce_pure_shell; do

        got=`$it + 1 0 4 2` expected=7
        expectation "0 don't break things"

        got=`$it \* 0 4 8 ` expected=0
        expectation "multiplication by 0 correctly handled"

        got=`$it \* 1 4 8 ` expected=32
        expectation "normal multiplication"

        got=`$it - 10 5 2` expected=3
        expectation "normal minus"

    done

    # more tests:
    # * division by zero ?
    # * negative numbers ?

}

prove i_can_reduce

