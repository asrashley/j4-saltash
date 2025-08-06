CHOWN = chown
CP = cp -f
TAR = tar

DEST_DIR = ../public_html
TEMPLATE_DEST = $(DEST_DIR)/templates/saltash
MEDIA_DEST = $(DEST_DIR)/media/templates/site/saltash

ZIP_CONTENTS = \
*.json \
*.php \
*.xml \
*.png \
html \
images \
media \
language

.PHONY: media images

all: media images

media:
	$(MAKE) -C media

images:
	$(MAKE) -C images

zip: saltash.zip

saltash.zip: $(ZIP_CONTENTS)
	$(RM) saltash.zip
	zip -r saltash.zip $(ZIP_CONTENTS) -x@exclude.lst

clean:
	$(RM) saltash.zip
	$(MAKE) -C media clean
	$(MAKE) -C images clean

deploy:
	$(CP) *.php $(TEMPLATE_DEST)/
	$(CP) *.xml $(TEMPLATE_DEST)/
	$(CP) joomla.asset.json $(TEMPLATE_DEST)/
	$(CP) -r images $(TEMPLATE_DEST)
	$(CP) -r media/css $(MEDIA_DEST)
	$(CP) -r media/images $(MEDIA_DEST)
	$(CP) -r media/js $(MEDIA_DEST)
	$(CP) -r media/scss $(MEDIA_DEST)
	$(CP) -r language/en-GB/*.ini $(DEST_DIR)/language/en-GB/
	$(CP) -r html $(TEMPLATE_DEST)
	$(CHOWN) -R www-data:www-data $(TEMPLATE_DEST)
	$(CHOWN) -R www-data:www-data $(MEDIA_DEST)
	$(CHOWN) -R www-data:www-data $(DEST_DIR)/language/en-GB/*.ini
