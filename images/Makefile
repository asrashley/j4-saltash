all: icons/site.webmanifest

icons/site.webmanifest: Icon.svg
	../node_modules/.bin/realfavicon generate Icon.svg favicon-settings.json output-data.json icons

clean:
	$(RM) icons/*.png icons/*.ico icons/*.svg icons/site.webmanifest output-data.json
