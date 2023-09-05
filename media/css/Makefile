VPATH = ../scss
TEMPLATE_SRCS = $(wildcard ../scss/blocks/*.scss ../scss/system/*/*.scss)
TEMPLATE_SRCS += $(wildcard ../scss/tools/*.scss ../scss/tools/*/*.scss)
TEMPLATE_SRCS += $(wildcard ../scss/vendor/*.scss ../scss/vendor/*/*.scss)

ALL = template.css template.min.css template.min.css.gz \
template-rtl.css template-rtl.min.css template-rtl.min.css.gz \
offline.css offline.min.css offline.min.css.gz \
user.css user.min.css user.min.css.gz

%.min.css.gz: %.min.css
	$(RM) $@
	gzip -k $<

%.min.css: %.css
	yui-compressor --type=css $< > $@

%.css: %.scss
	sass $< > $@

.PHONY: global vendor

all: global vendor $(ALL)

template.css: $(TEMPLATE_SRCS)

template-rtl.css: $(TEMPLATE_SRCS)

offline.css: $(TEMPLATE_SRCS)

global:
	$(MAKE) -C global

vendor:
	$(MAKE) -C vendor

clean:
	$(RM) $(ALL)
	$(MAKE) -C global clean
	$(MAKE) -C vendor clean
