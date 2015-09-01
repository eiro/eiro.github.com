# depth is defined in subdirectories as .., ../.. and so on. 
depth?=.
include site.mk
feed= news.html atom.xml unixtips.html unixtips.atom.xml

all: $(basics) $(webpages) theme.css

website: FORCE $(webpages) 

FORCE:
	perl6 bin/atom atom > atom.xml
	perl6 bin/atom news > news.md
	cd posts/2015; make

menu: menu.md.
	m4 -I$(depth)/m4 post defs render $< | pandoc -t html5 -o $@ 

clean:
	rm -f menu $(webpages)

%.css: %.styl
	stylus -c $<

$(keywords_m4): $(depth)/keywords
	perl bin/m4keys  $< > $@
	
.md.html: $(basics)
	$(htmlify) < $< > $@
