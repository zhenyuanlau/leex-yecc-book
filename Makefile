Q := @

CHAPTERS := $(shell find chapters -type f)

PDF_THEMES_DIR := resources/themes
PDF_THEME := resources/themes/pdf-theme.yml
PDF_FONTS_DIR := resources/fonts
IMAGES_DIR := resources/images

PDF_BOOK := LeexAndYecc.pdf

default: clean $(PDF_BOOK)

$(PDF_BOOK): document.adoc
	$(Q) asciidoctor-pdf --doctype=book -a imagesdir=$(IMAGES_DIR) -a pdf-theme=$(PDF_THEME) -a pdf-fontsdir=$(PDF_FONTS_DIR) $< -o $@

clean:
	$(Q) rm -fr $(PDF_BOOK)
