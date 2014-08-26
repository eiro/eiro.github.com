# depth is defined in subdirectories as .., ../.. and so on. 
depth?=.
include site.mk
feed= news.html atom.xml unixtips.html unixtips.atom.xml
all: $(webpages) $(feed)

news.md: $(depth)/feed
	atombomb md $< | $(can_comment) > $@

atom.xml: $(depth)/feed
	atombomb atom $< > $@

# UGLY copy-past from previous lines, TODO: find a generic solution 

unixtips.html: unixtips
	atombomb md $< | $(can_comment) > $@

unixtips.atom.xml: unixtips
	atombomb atom $< > $@

$(webpages): menu $(main_html_template)

.md.html: 
	$(htmlify) -s -B menu -o $@ $<

menu: menu.md.
	pandoc -t html5 -o $@ $<

clean:
	rm -f menu $(webpages)
