uzu devel/TAP :all

render () {
    m4 -Im4 post defs render - <<< "$*" |
        head -c 1k # protect from endless recursion of a macro
}

m4_macros_are_working () {
    local err=/tmp/tap.err.$$ 
    for from expected (
    "_CATV" '<a href="http://cat-v.org/">cat-v</>'

    "_PERLDOC" '<a href="http://perldoc.perl.org/">Perldoc</a>})'
    "_PERLDOC()" '<a href="http://perldoc.perl.org/">Perldoc</a>})'

    "_PERLDOC(perlsub.html#Signatures,signatures)"
    '<a href="http://perldoc.perl.org/perlsub.html#Signatures">signatures</a>})'

    "_PERLDOQ(perlsub,Signatures,signatures)"
    '<a href="http://perldoc.perl.org/perlsub.html#Signatures">signatures</a>})'

    "_PERLDOQ(perlsub,Signatures)"
    '<a href="http://perldoc.perl.org/perlsub.html#Signatures">signatures</a>})'

    ) {
        got="$( render "$from" 2>$err )"
        expected "correct render of $from" || {
            diag <<< "outputs: $got"
            diag < $err
        }
    }
}


prove m4_macros_are_working

# working_macros_set () {
# 
#     local from got expected
# 
#     for from expected (
#         _PERLDOC           '<a href="http://perldoc.perl.org/">'
#         "_PERLDOC(perlre)" '<a href="http://perldoc.perl.org/perlre.html">'
#         _PERL               x
#     ) { got="$( render $from )"
#         is "$got" "$expected" "can render $from" ||
#             note "got $got"
#     }
# }
# 
# 
# prove working_macros_set 


# render () { m4 -Im4 defs - <<< "$*" }
# macros_are_working () {
# 
#     local desc macro got expected
# 
#     for desc macro expected (
# 
#     '_PERLDOCSEC with 2 args'
#     '_PERLDOCSEC(perlsub,Signatures)'
#     '[Signatures](http://perldoc.perl.org/perlsub.html#Signatures)'
# 
#     '_PERLDOCSEC with 3 args'
#     '_PERLDOCSEC(perlsub,Signatures,signatures introduced in perl 5.20)'
#     '[signatures introduced in perl 5.20](http://perldoc.perl.org/perlsub.html#Signatures)'
# 
#     ) {
#         test "$(render $macro)" = "$expected"
#         ok $desc
#     }
# }
# 
# prove :plan 2 macros_are_working
# m4 defs - <<'SH' | f | pandoc -t html5 | t
#     getent passwd nobody root |
#         perl _PERLFLAG(-n) _PERLFLAG(-l) _PERLFLAG(-F,_pattern_): -E'
#             say if $F[-1] =~ /sh$/
# SH

# render () {
#         pandoc -f markdown -t html |
#         m4 -Im4 post defs
# }


# () {
#     local argz='"$@"'
#     eval "4$1(){ m4 -Im4 proc pre $argz - }"
# } pre post

# changequote({{{{,}}}}) 
#
#

# m4/x
# m4/pre
# m4/proc
# m4/post
# m4/defs
# m4/.defs.swp

# 
# # m4 -Im4 x defs - <<< "_DEFL(zoo,zoo,http://bida)_ZOO"
# # m4 -Im4 x defs - <<< "_DEFP(zoo,http://bida)_ZOO"
# 
# # render <<'AR'
# # example of _POD4(strict) pragma
# # 
# # _SNIPPET({{{{
# #     use _POD4(strict);
# #     use _POD4(warnings);
# # }}}})
# # 
# # conclusion: use _POD4(strict) 
# # AR
# # 
