VPATH = ../../scss/global:../../scss/tools
TEMPLATE_SRCS = $(wildcard ../../scss/tools/*.scss ../../scss/tools/*/*.scss)

ALL = \
fonts-noto.css \
fonts-noto.min.css \
fonts-noto.min.css.gz \
fonts-playfair.css \
fonts-playfair.min.css \
fonts-playfair.min.css.gz \
fonts-roboto.css \
fonts-roboto.min.css \
fonts-roboto.min.css.gz \
fonts-sanchez.css \
fonts-sanchez.min.css \
fonts-sanchez.min.css.gz \
colors_standard.css \
colors_standard.min.css \
colors_standard.min.css.gz \
colors_alternative.css \
colors_alternative.min.css \
colors_alternative.min.css.gz

%.min.css.gz: %.min.css
	$(RM) $@
	gzip -k $<

%.min.css: %.css
	$(RM) $@
	yui-compressor --type=css $< > $@

%.css: %.scss
	$(RM) $@
	sass $< > $@

.PHONY: clean
.DELETE_ON_ERROR: $(ALL)

all: $(ALL)

colors_standard.css: _tools.scss colors_standard.scss $(TEMPLATE_SRCS)

colors_alternative.css: _tools.scss colors_alternative.scss $(TEMPLATE_SRCS)

clean:
	$(RM) $(ALL)
