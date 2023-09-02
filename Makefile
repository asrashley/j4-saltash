CHOWN = chown
CP = cp -f
TAR = tar

DEST_DIR = ../public_html
TEMPLATE_DEST = $(DEST_DIR)/templates/garibaldi
MEDIA_DEST = $(DEST_DIR)/media/templates/site/garibaldi

ZIP_CONTENTS = \
*.json \
*.php \
*.xml \
*.png \
html \
media \
language

.PHONY: media

all: media

media:
	$(MAKE) -C media

zip: garibaldi.zip

garibaldi.zip: $(ZIP_CONTENTS)
	$(RM) garibaldi.zip
	zip -r garibaldi.zip $(ZIP_CONTENTS) -x@exclude.lst

clean:
	$(RM) garibaldi.zip
	$(MAKE) -C media clean

deploy:
	$(CP) *.php $(TEMPLATE_DEST)/
	$(CP) *.xml $(TEMPLATE_DEST)/
	$(CP) joomla.asset.json $(TEMPLATE_DEST)/
	# cd media && $(TAR) -cf - * | $(TAR) -xf - -C $(MEDIA_DEST)
	$(CP) -r media/css $(TEMPLATE_DEST)
	$(CP) -r media/css $(MEDIA_DEST)
	$(CP) -r media/images $(MEDIA_DEST)
	$(CP) -r media/js $(MEDIA_DEST)
	$(CP) -r media/scss $(MEDIA_DEST)
	$(CP) -r language/en-GB/*.ini $(DEST_DIR)/language/en-GB/
	$(CP) -r html $(TEMPLATE_DEST)
	$(CHOWN) -R www-data:www-data $(TEMPLATE_DEST)
	$(CHOWN) -R www-data:www-data $(MEDIA_DEST)
	$(CHOWN) -R www-data:www-data $(DEST_DIR)/language/en-GB/*.ini
