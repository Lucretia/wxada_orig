# Makefile for documents.

SRCS	=	design.tex

DVI		=	$(SRCS:.tex=.dvi)
PS		=	$(DVI:.dvi=.ps)
PDF		=	$(PS:.ps=.pdf)

all: $(PDF)

%.pdf: %.ps
	ps2pdf14 $< $@

%.ps: %.dvi
	dvips -f < $< > $@

%.dvi: %.tex prologue.tex
	latex $<
#	bibtex $*
	latex $<
	latex $<

#target-clean:
clean:
	-rm *.aux *.log *.dvi *.pdf *.ps *.toc *.out *.bbl *.blg *~
	
