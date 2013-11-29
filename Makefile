.POSIX:
.SUFFIXES: .md .html
# unsemantic_gr = https://raw.github.com/nathansmith/unsemantic/master/assets/stylesheets/unsemantic-grid-responsive-no-ie7.css
# with_css = -c $(unsemantic_gr) -c theme.css
htmlify  = pandoc --toc $(with_css) --template template.html5
mdpages  = $(wildcard *.md )
webpages = ${mdpages:.md=.html}

all: menu $(webpages)

menu: menu.md.
	pandoc -t html5 -o $@ $<

.md.html: 
	$(htmlify) -s -B menu -o $@ $< 

clean:
	rm -f menu $(webpages)
