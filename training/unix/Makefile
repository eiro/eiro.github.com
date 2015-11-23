DONE= terminal/introduction.md
DONE=
FINAL= terminal/yaml $(DONE) terminal/zsh.md


all: terminal.pdf

%.latex %.pdf: %.md
	pandoc -s -t beamer+pipe_tables+grid_tables+multiline_tables+escaped_line_breaks -o $@ $<

%.pgf: %.gv
	dot -Txdot $< | dot2tex --codeonly > $@

terminal.md: prelude.tex

terminal.md: $(FINAL)
	cat $(FINAL) > $@

