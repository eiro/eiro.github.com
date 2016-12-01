all: slides.pdf

# gnome2-fancy-pat.svg:
# 	wget https://people.gnome.org/~jdub/random/logo/gnome2-fancy-pat.svg
# 
slides.pdf: prelude.latex

%.pdf: %.svg
	rsvg-convert -f pdf -o $@ $<

%.latex %.pdf: %.md
	pandoc -s -t beamer+pipe_tables+grid_tables+multiline_tables+escaped_line_breaks -o $@ $<

