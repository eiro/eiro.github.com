#.SUFFIXES: .md .html .json

all: zsh.pdf

%.pdf: %.md

%.pdf: %.md
	pandoc -tbeamer+grid_tables -o $@ $< 
