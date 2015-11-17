TEX= latex --shell-escape
# --interaction=batchmode

%.svg: %.dvi
	dvisvgm $<

%.png: %.dvi
	dvipng $< 
