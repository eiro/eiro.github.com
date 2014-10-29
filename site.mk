.POSIX:
.SUFFIXES: .md .html

mdpages  = $(wildcard *.md)
webpages = ${mdpages:.md=.html}

main_html_template=$(depth)/template.html5
htmlify      = pandoc -Vdepth=$(depth) --toc --template $(main_html_template)
can_comment  = perl $(depth)/add_comment_links.pl

.md.html: $(main_html_template) menu
	$(htmlify) -s -B menu -o $@ $<
