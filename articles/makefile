depth= ..
corpus=articles
include $(depth)/site.mk

.md.html: $(main_html_template)
	perl $(depth)/bin/post_menu $(corpus)/$< > menu
	$(htmlify) < $< > $@

all: $(webpages)

# include $(depth)/Makefile
