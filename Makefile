version = $(shell cat version.txt)

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

	cd $(static_dir) && $(requirejs_dir)/build/build.sh build.js
	cd $(static_dir)/settings && $(requirejs_dir)/build/build.sh build.js
	cd $(static_dir)/share && $(requirejs_dir)/build/build.sh build.js
	cd $(static_dir)/share/panel && $(requirejs_dir)/build/build.sh build.js

dist: web
	rsync -av ./ dist/client-share-web-$(version)/ --exclude=dist/ -C
	cd dist && tar zcvf client-share-web-$(version).tar.gz client-share-web-$(version)
	# This is so Hudson can get stable urls to this tarball
	ln -sf client-share-web-$(version).tar.gz dist/client-share-web-current.tar.gz
	rm -rf dist/client-share-web-$(version)

clean:
	rm -rf $(static_dir) dist/*

.PHONY: clean web $(static_dir) dist
