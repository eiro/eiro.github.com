.POSIX:
.SUFFIXES: .md .html
SHELL=/bin/zsh

mdpages  = $(wildcard *.md)
webpages = ${mdpages:.md=.html}
main_html_template=$(depth)/template.html5

htmlify = \
    { m4 $(depth)/defs - |\
	pandoc -Vdepth=$(depth) \
	--toc --template $(main_html_template) -s -B menu }

can_comment  = perl $(depth)/add_comment_links.pl

buildpage    = $(htmlify) 

.md.html: $(main_html_template) menu
	$(buildpage) < $< > $@ 
