
OUTPUTS=main.slides.pdf main.slides_notes.pdf main.handout.pdf

GRAPHS=add_commit decentralized git_object_database linear_branching \
    linear_branching_continued merge-diagram

PULL_PUSH_SVG=pull_push.svg
PULL_PUSH_PDF=$(foreach i,1 2 3 4 5 6 7,pull_push_$i.pdf)

LINEAR_HISTORY_SVG=linear_history.svg
LINEAR_HISTORY_PDF=$(foreach i,1 2 3 4 5 6 7 8 9 10 11 12,linear_history_$i.pdf)

GRAPH_1_PDF=$(patsubst %,%.pdf,$(GRAPHS))
GRAPH_ALL_PDF=$(GRAPH_1_PDF) $(PULL_PUSH_PDF) $(LINEAR_HISTORY_PDF)

all: $(OUTPUTS)

realclean: clean
	rm -f main.*.pdf

clean:
	rm -f *.aux *.toc *.out *.snm *.log *.nav *.vrb *~

main.%.pdf: main.%.tex main.%.aux main.tex $(GRAPH_ALL_PDF)
	pdflatex $<

main.%.aux: main.%.tex
	pdflatex $<

$(PULL_PUSH_PDF): $(PULL_PUSH_SVG)
	@echo "***** Please generate $@ from $<"
	@exit 1

$(LINEAR_HISTORY_PDF): $(LINEAR_HISTORY_SVG)
	@echo "***** Please generate $@ from $<"
	@exit 1

$(GRAPH_1_PDF): %.pdf: %.svg
	@echo "***** Please generate $@ from $<"
	@exit 1

