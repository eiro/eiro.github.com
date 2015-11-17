uzu devel/TAP :all

render () {
        echo "$*"                   |
        pandoc -f markdown -t html5 |
        # ensure pandoc don't break anything
        m4 -Im4 post defs render -  |
        head -c 1k # protect from endless recursion of a macro
}

m4_macros_are_working () {
    local err=/tmp/tap.err.$$ 
    touch $err
    for from expected (

    "_CATV" '<a href="http://cat-v.org/">cat-v</a>'

    "_PERLDOC" '<a href="http://perldoc.perl.org/">Perldoc</a>'
    "_PERLDOC()" '<a href="http://perldoc.perl.org/">Perldoc</a>'

    "_PERLDOC(perlsub.html#Signatures,signatures)"
    '<a href="http://perldoc.perl.org/perlsub.html#Signatures">signatures</a>'

    "_PERLDOCSEC(perlsub,signatures,Signatures)"
    '<a href="http://perldoc.perl.org/perlsub.html#Signatures">signatures</a>'

    "_PERLDOCSEC(perlsub,perl subroutines)"
    '<a href="http://perldoc.perl.org/perlsub.html">perl subroutines</a>'

    "_PERLDOCSEC(perlsub,perl subroutines)"
    '<a href="http://perldoc.perl.org/perlsub.html">perl subroutines</a>'  

    '_POD4(Module::Runtime)'
    '<a href="https://metacpan.org/pod/Module::Runtime">Module::Runtime</a>'  

    '_POD4(Moo)'
    '<a href="https://metacpan.org/pod/Moo">Moo</a>'  

    "_PERLFLAG(E,commandline)"
    '<a href="http://perldoc.perl.org/perlrun.html#*-E*_commandline_">-E</a>'

    "_PERLFLAG(w)"
    '<a href="http://perldoc.perl.org/perlrun.html#*-w*">-w</a>'

    ) {
        got="$( render "$from" )"
        expected='<p>'"$expected"'</p>'
        expected "correct render of $from" || {
            diag <<< "got     : $got
expected: $expected"
            diag < $err
        }
    }
}

prove m4_macros_are_working
