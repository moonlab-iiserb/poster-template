.PHONY: main clean FORCE

main: main.pdf

main.pdf: FORCE
	latexmk -pdflua main.tex

clean:
	latexmk -C
