set -u

LAST_ERROR=${LAST_ERROR-}
warn     () { LAST_ERROR=$?; echo "$*" >&2; return $LAST_ERROR ; }
die      () { LAST_ERROR=$?; echo "$*" >&2; exit   $LAST_ERROR ; }

alias error='warn "in $0 line ${LINENO-unknown}:"'
alias ...='{error Unimplemented; return 255 ;}'
alias unreachable='{error Unreachable; return 255; }'

tap_y    () { tap_msg ok "$*" ; }
tap_n    () { tap_msg 'not ok' "$*"; }
tap_note () { echo "# $*"   ; }
tap_cat  () { sed 's/^/# /' ; }
tap_msg  () {
    _tap_msg_index=$(( $_tap_msg_index + 1 ))
    echo "$1 $_tap_msg_index $2"
}

tap_ok () {
    local r=$?
    if test $r -eq 0
        then  tap_y "$*"
        else  tap_n "$*"
    fi
    return $r 
}

tap_plan () { echo 1..${1?number of expected tests} ; }

tap_prove () {
    local _tap_msg_index=0 got expected
    "$@"
}


: <<\=cut

=head1 TAP producer for POSIX compliant shells

    tested with         :
        dash, mksh, busybox sh
    tries to conform to :
        POSIX.2013 (http://pubs.opengroup.org/onlinepubs/9699919799/)

=head2 Example

    alias @='for it in'
    @ ok prove note; do alias $it=tap_$it
    done

    basics_of_math () {
        tap_plan 2
        true   ;  ok "truth, straight"
        false  ;  ok "you shall not pass"
        note "because false doesn't pass"
        note "but i can count to 5"
        seq 5| tap_cat
        test 1 -eq 1; ok "one is one"
        test 1 -eq 2; ok "one is not two"
    }

    prove basics_of_math

=cut
