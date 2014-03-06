.POSIX:
.SUFFIXES: .md .html
# unsemantic_gr = https://raw.github.com/nathansmith/unsemantic/master/assets/stylesheets/unsemantic-grid-responsive-no-ie7.css
# with_css = -c $(unsemantic_gr) -c theme.css
htmlify  = pandoc --toc $(with_css) --template template.html5
mdpages  = $(wildcard *.md )
webpages = ${mdpages:.md=.html}
feed= news.html atom.xml unixtips.html unixtips.atom.xml

all: $(webpages) $(feed)

news.md: feed
	atombomb md $< | perl add_comment_links.pl > $@

atom.xml: feed
	atombomb atom $< > $@

# UGLY copy-past from previous lines, TODO: find a generic solution 

unixtips.html: unixtips
	atombomb md $< | perl add_comment_links.pl > $@

unixtips.atom.xml: unixtips
	atombomb atom $< > $@

$(webpages): menu template.html5

.md.html: 
	$(htmlify) -s -B menu -o $@ $<

menu: menu.md.
	pandoc -t html5 -o $@ $<


clean:
	rm -f menu $(webpages)
