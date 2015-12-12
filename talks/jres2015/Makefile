depth= ../..
# corpus=posts/2015
include $(depth)/site.mk

# .md.html: $(main_html_template)
# 	perl $(depth)/bin/post_menu $(corpus)/$< > menu
# 	$(htmlify) < $< > $@

.md.html: 
	$(htmlify) < $< > $@

%.latex %.pdf: %.md
	pandoc  -s -t beamer+pipe_tables+grid_tables+multiline_tables+escaped_line_breaks -o $@ $<

all: index.html lt.pdf

# include $(depth)/Makefile
