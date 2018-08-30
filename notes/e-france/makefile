depth= ..
corpus=posts/2018
include $(depth)/site.mk

all: $(webpages)
index.html: whoswho.svg

.dot.svg: ; dot -T svg -o $@ $<
.md.html: $(main_html_template)
	perl $(depth)/bin/post_menu $(corpus)/$< > menu
	$(htmlify) < $< > $@


# include $(depth)/Makefile
