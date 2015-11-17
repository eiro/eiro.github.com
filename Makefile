# depth is defined in subdirectories as .., ../.. and so on. 
depth?=.
include site.mk
feed= news.html atom.xml unixtips.html unixtips.atom.xml

all: $(basics) $(webpages) theme.css

website: FORCE $(webpages) 

FORCE:
	perl bin/atom5 atom > atom.xml
	perl bin/atom5 news > news.md
	cd posts/2015; make

menu: menu.md.
	m4 -I$(depth)/m4 post defs render $< | pandoc -t html5 -o $@ 

clean:
	rm -f menu $(webpages)

%.css: %.styl
	stylus -c $<

r.html: test_defs.zsh
	zsh test_defs.zsh > r.tap
	tapprouve r.tap > r.html

$(keywords_m4): $(depth)/keywords
	perl bin/m4keys  $< > $@
	
.md.html: $(basics)
	$(htmlify) < $< > $@

snitch:
	@echo mdpages:  $(mdpages)
	@echo webpages: $(webpages)

test:
	zsh tests.zsh > t/results

	@echo webpages: $(webpages)
