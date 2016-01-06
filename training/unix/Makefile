DONE=\
    formations/pratique.md \
    terminal/introduction.md \
    terminal/fs.md \
    terminal/globs.md \
    terminal/zsh.md \
    terminal/vim.md \

#DONE=
WIP=\
    terminal/vim.md \

FINAL= terminal/yaml $(DONE) $(WIP)

all: terminal.pdf cahier-exos.pdf sandbox.pdf

%.latex %.pdf: %.md
	pandoc  -s -t beamer+pipe_tables+grid_tables+multiline_tables+escaped_line_breaks -o $@ $<

%.pgf: %.gv
	dot -Txdot $< | dot2tex --codeonly > $@

terminal/yaml: prelude.tex
terminal.md: $(FINAL)
sandbox.md:  terminal/yaml sandbox/cours.md
cahier-exos.md: terminal/yaml exos.md

terminal.md cahier-exos.md sandbox.md:
	cat $^ > $@

exos.tgz:
	tar czf $@ exos

