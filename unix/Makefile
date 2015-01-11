depth?=..
include $(depth)/site.mk

$(webpages): menu $(main_html_template)

menu: menu.md.
	pandoc -t html5 -o $@ $<

