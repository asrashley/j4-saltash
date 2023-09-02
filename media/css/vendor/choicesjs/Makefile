VPATH = ../../../scss/vendor/choicesjs
ALL = choices.css choices.min.css choices.min.css.gz

%.min.css.gz: %.min.css
	$(RM) $@
	gzip -k $<

%.min.css: %.css
	yui-compressor --type=css $< > $@

%.css: %.scss
	sass $< > $@

all: $(ALL)

clean:
	$(RM) $(ALL)