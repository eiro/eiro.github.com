depth?=..
include $(depth)/site.mk
podoc=

all: index.html $(webpages)

pod-uze.chunk:
	(cd ~/bin/uze; cat uze | \
	    sed 's#^\\\*#*#; s,^#,##,' ) > $@

pod-libs.chunk:
	(cd ~/bin/uze; cat uze | \
	    sed 's#^\\\*#*#; s,^#,##,' ) > $@

index.html: pod-uze.chunk pod-libs.chunk
	m4 $< | pod2markdown |\
	    pandoc --template=bootstrap $^ > $@

$(webpages): $(depth)/menu $(main_html_template) $(mdpages)



