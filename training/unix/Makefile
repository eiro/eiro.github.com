DONE= terminal/done.md
#DONE= 
FINAL= terminal/yaml $(DONE) terminal/wip.md

all: terminal.pdf

%.latex: %.md
	pandoc -s -t beamer+pipe_tables -o $@ $<

%.pdf: %.md
	pandoc -s -t beamer+pipe_tables -o $@ $<

%.pgf: %.gv
	dot -Txdot $< | dot2tex --codeonly > $@

terminal.md: prelude.tex

terminal.md: $(FINAL)
	cat $(FINAL) > $@

