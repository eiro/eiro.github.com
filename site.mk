.POSIX:
.SUFFIXES: .md .html .json
SHELL=/bin/zsh

mdpages  = $(wildcard *.md)
webpages = ${mdpages:.md=.html}
template_html=$(depth)/template.html5
keywords_m4=$(depth)/m4/defs
basics= $(template_html) $(keywords_m4) menu

# { m4 -I$(depth)/m4 pre defs - |\

htmlify = \
    { pandoc -Vdepth=$(depth) \
	--toc --template $(template_html) -s -B menu |\
	    m4 -I$(depth)/m4 post defs render - }

.md.json: menu
	m4 $(depth)/defs $<  | pandoc -Vdepth=$(depth) -tjson | json_pp > $@

can_comment  = perl $(depth)/add_comment_links.pl

