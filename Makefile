# depth is defined in subdirectories as .., ../.. and so on. 
depth?=.
include site.mk
feed= news.html atom.xml unixtips.html unixtips.atom.xml

all: $(webpages) theme.css

website: FORCE $(webpages) 

FORCE:
	perl6 bin/atom atom > atom.xml
	perl6 bin/atom news > news.md
	cd posts/2015; make

$(webpages): menu $(main_html_template)

menu: menu.md.
	pandoc -t html5 -o $@ $<

clean:
	rm -f menu $(webpages)

%.css: %.styl
	stylus -c $<
