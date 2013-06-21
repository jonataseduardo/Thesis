SOURCEFILE = main.tex

.PHONY: process dvi pdf clean ps all view spellcheck 
	

pdf : $(SOURCEFILE:.tex=.pdf)
ps : $(SOURCEFILE:.tex=.ps)

all : dvi view

view :	$(SOURCEFILE:.tex=.dvi) 
	xdvi $(SOURCEFILE:.tex=.dvi)


$(SOURCEFILE:.tex=.pdf)  : $(SOURCEFILE:.tex=.tex)
	( \
	\pdflatex $<; \
	while \grep -q "Rerun to get cross-references right."	$(<:.tex=.log); \
	do \
	\pdflatex $<; \
	done \
	)
	bibtex $(<:.tex=)
#makeindex $(<:.tex=)
	( \
	\pdflatex $<; \
	while \grep -q "Rerun to get cross-references right."	$(<:.tex=.log); \
	do \
	\pdflatex $<; \
	done \
	)
	( \
	\pdflatex $<; \
	while \grep -q "Rerun to get cross-references right."	$(<:.tex=.log); \
	do \
	\pdflatex $<; \
	done \
	)


clean : 
	rm -f \
	$(SOURCEFILE:.tex=.log)\	
	$(SOURCEFILE:.tex=.lg) \ 
	$(SOURCEFILE:.tex=.aux)\ 
	$(SOURCEFILE:.tex=.css)\ 
	$(SOURCEFILE:.tex=.tmp)\ 
	$(SOURCEFILE:.tex=.out)\ 
	$(SOURCEFILE:.tex=.toc)\ 
	$(SOURCEFILE:.tex=.idv)\ 
	$(SOURCEFILE:.tex=.idx)\ 
	$(SOURCEFILE:.tex=.html)\
	$(SOURCEFILE:.tex=.4ct)\
	$(SOURCEFILE:.tex=.4tc)\
	$(SOURCEFILE:.tex=.xref)\
	
	
