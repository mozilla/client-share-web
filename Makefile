version=$(shell cat version.txt)

ifeq ($(TOPSRCDIR),)
  export TOPSRCDIR = $(shell pwd)
endif
web_dir=$(TOPSRCDIR)/dev
static_dir=$(TOPSRCDIR)/$(version)
requirejs_dir=$(TOPSRCDIR)/tools/requirejs

web: $(static_dir)

$(static_dir):
	rsync -av $(web_dir)/ $(static_dir)/

	find $(static_dir) -name \*.html | xargs perl -i -pe 's:/dev/:/$(version)/:go'
	perl -i -pe 's:/dev/:/$(version)/:go' $(static_dir)/scripts/oauth.js

	cd $(static_dir)/1/settings && $(requirejs_dir)/build/build.sh build.js
	cd $(static_dir)/1/share/panel && $(requirejs_dir)/build/build.sh build.js
clean:
	rm -rf $(static_dir)

.PHONY: clean web $(static_dir)
