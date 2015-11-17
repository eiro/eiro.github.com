DONE= terminal/done.md
DONE= 
FINAL= terminal/yaml $(DONE) terminal/wip.md

all: terminal.pdf

%.latex: %.md
	pandoc -s -t beamer+pipe_tables -o $@ $<

%.pdf: %.md
	pandoc -s -t beamer+pipe_tables -o $@ $<

terminal.md: $(FINAL)
	cat $^ > $@
