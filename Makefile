CHOWN = chown
CP = cp -f

DEST_DIR = ../public_html
TEMPLATE_DEST = $(DEST_DIR)/templates/garibaldi

ZIP_CONTENTS = \
*.json \
*.php \
*.xml \
*.png \
css \
scss \
js \
html \
images \
language

.PHONY: css

all: css

css:
	$(MAKE) -C css

zip: garibaldi.zip

garibaldi.zip: $(ZIP_CONTENTS)
	$(RM) garibaldi.zip
	zip -r garibaldi.zip $(ZIP_CONTENTS) -x scss/.sass-cache

clean:
	$(RM) garibaldi.zip
	$(MAKE) -C css clean

deploy:
	$(CP) *.php $(TEMPLATE_DEST)/
	$(CP) *.xml $(TEMPLATE_DEST)/
	$(CP) css/*.css* $(TEMPLATE_DEST)/css/
	$(CP) -r css/global $(TEMPLATE_DEST)/css/
	$(CP) -r css/system $(TEMPLATE_DEST)/css/
	$(CP) -r css/vendor $(TEMPLATE_DEST)/css/
	$(CP) -r language/en-GB/*.ini $(DEST_DIR)/language/en-GB/
	$(CHOWN) www-data:www-data $(TEMPLATE_DEST)/css/*.css
	$(CHOWN) -R www-data:www-data $(TEMPLATE_DEST)/css/vendor
	$(CHOWN) -R www-data:www-data $(DEST_DIR)/language/en-GB/*.ini
