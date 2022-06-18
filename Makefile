Q := @

CHAPTERS := $(shell find chapters -type f)

PDF_THEME := data/themes/pdf-theme.yml
PDF_FONTS_DIR := data/fonts
IMAGES_DIR := data/images

PDF_BOOK := LeexAndYecc.pdf

default: clean $(PDF_BOOK)

$(PDF_BOOK): $(CHAPTERS) book.adoc
	asciidoctor-pdf --doctype=book -a imagesdir=$(IMAGES_DIR) -a pdf-theme=$(PDF_THEME) -a pdf-fontsdir=$(PDF_FONTS_DIR) book.adoc -o $@

clean:
	$(Q) rm -fr $(PDF_BOOK)
