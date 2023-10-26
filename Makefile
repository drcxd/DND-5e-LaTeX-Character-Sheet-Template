.PHONY: example clean

example: unnamed.pdf

clean:
	rm *.pdf

%.pdf: characters/%.tex
	CHARACTERNAME=$(basename $< |  sed 's:.*/::')
	rm -rdf CHARACTERNAME
	mkdir CHARACTERNAME
	xelatex $<

lmop: cleric.pdf rogue.pdf fighter1.pdf wizard.pdf

lmopbg: rogue_background.tex fighter1_background.tex
	latexmk --interaction=nonstopmode --pdf --pdflatex=pdflatex rogue_background.tex
	latexmk --interaction=nonstopmode --pdf --pdflatex=pdflatex fighter1_background.tex
	latexmk --interaction=nonstopmode --pdf --pdflatex=pdflatex cleric_background.tex
	latexmk --interaction=nonstopmode --pdf --pdflatex=pdflatex wizard_background.tex

