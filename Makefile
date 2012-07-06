SRC = ${npm_package_directories_src}
LIB = ${npm_package_directories_lib}

JQUERY_SUMODULE_DIR = lib/jquery
JQUERY              = $(JQUERY_SUMODULE_DIR)/dist/jquery.js

NQUERY    = ${npm_package_main}
M4_NQUERY = $(basename $(NQUERY)).m4$(suffix $(NQUERY))

.PHONY: build
build: $(NQUERY)

.PHONY: prepublish
prepublish: clean build mostlyclean

.PHONY: postpublish
postpublish:
	git tag -s v${npm_package_version} -m 'Release ${npm_package_version}.'
	git push origin v${npm_package_version}

$(NQUERY): $(JQUERY) $(M4_NQUERY)
	m4 --prefix-builtins --include $(dir $(JQUERY)) $(M4_NQUERY) > $@

$(JQUERY): $(JQUERY_SUMODULE_DIR)
	$(MAKE) -C $^

$(JQUERY_SUMODULE_DIR): FORCE
	git submodule update --init

$(LIB)/%.js: $(SRC)/%.coffee
	coffee --compile --print $< > $@

#.PHONY: test
#test: build

.PHONY: mostlyclean
mostlyclean:
	rm -Rf $(JQUERY_SUMODULE_DIR) $(M4_NQUERY)

.PHONY: clean
clean: mostlyclean
	rm -Rf $(NQUERY)

FORCE:

.PHONY: debug
debug:
	@echo "debug"