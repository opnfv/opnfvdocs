BUILDDIR = build
DESIGN_DOCS = $(wildcard design_docs/*.rst)

RST2HTML = rst2html.py
SPHINXBUILD = sphinx-build
LATEXOPTS = "--interaction=nonstopmode"

.PHONY: clean html pdf all

all: html pdf

clean:
	rm -rf $(BUILDDIR)/*

html: $(DESIGN_DOCS)
ifneq ($(DESIGN_DOCS), )
	mkdir -p build/design_docs
	$(RST2HTML) $^ $(BUILDDIR)/$(^:.rst=.html)
endif
	$(SPHINXBUILD) -b html -c etc -d $(BUILDDIR)/doctrees \
	    requirements $(BUILDDIR)/requirements/html

pdf:
	$(SPHINXBUILD) -b latex -c etc -d $(BUILDDIR)/doctrees \
	    requirements $(BUILDDIR)/requirements/latex
	$(MAKE) -C $(BUILDDIR)/requirements/latex \
	    LATEXOPTS='$(LATEXOPTS)' all-pdf
