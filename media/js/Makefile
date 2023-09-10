
ALL = \
template.min.js template.min.js.gz \
user.min.js user.min.js.gz

%.min.js.gz: %.min.js
	$(RM) $@
	gzip -k $<

%.min.js: %.js
	$(RM) $@
	yui-compressor --type=js $< > $@

.PHONY: clean
.DELETE_ON_ERROR: $(ALL)

all: $(ALL)

clean:
	$(RM) $(ALL)
