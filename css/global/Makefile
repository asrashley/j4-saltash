VPATH = ../../scss/global:../../scss/tools

ALL = \
fonts-local_roboto.css \
fonts-local_roboto.min.css \
fonts-local_roboto.min.css.gz \
fonts-web_playfair.css \
fonts-web_playfair.min.css \
fonts-web_playfair.min.css.gz \
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

all: $(ALL)

colors_standard.css: _tools.scss colors_standard.scss

colors_alternative.css: _tools.scss colors_alternative.scss

clean:
	$(RM) $(ALL)
