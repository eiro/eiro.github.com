uzu devel/TAP :all

render () { m4 defs - <<< "$*" }

macros_are_working () {

    local desc macro got expected

    for desc macro expected (

    '_PERLDOCSEC with 2 args'
    '_PERLDOCSEC(perlsub,Signatures)'
    '[Signatures](http://perldoc.perl.org/perlsub.html#Signatures)'

    '_PERLDOCSEC with 3 args'
    '_PERLDOCSEC(perlsub,Signatures,signatures introduced in perl 5.20)'
    '[signatures introduced in perl 5.20](http://perldoc.perl.org/perlsub.html#Signatures)'

    ) {
        test "$(render $macro)" = "$expected"
        ok $desc
    }

}


prove :plan 2 macros_are_working
