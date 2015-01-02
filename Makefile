# depth is defined in subdirectories as .., ../.. and so on. 
depth?=.
include site.mk
feed= news.html atom.xml unixtips.html unixtips.atom.xml
all: FORCE $(webpages)

FORCE:
	perl6 bin/atom atom > atom.xml
	perl6 bin/atom news > news.md
	# (cd posts/2015; make )

# # UGLY copy-past from previous lines, TODO: find a generic solution 
# 
# unixtips.html: unixtips
# 	atombomb md $< | $(can_comment) > $@
# 
# unixtips.atom.xml: unixtips
# 	atombomb atom $< > $@

$(webpages): menu $(main_html_template)

menu: menu.md.
	pandoc -t html5 -o $@ $<

clean:
	rm -f menu $(webpages)
