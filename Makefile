SRC = ${npm_package_directories_src}
LIB = ${npm_package_directories_lib}

JQUERY_SUMODULE_DIR = lib/jquery
JQUERY              = ${JQUERY_SUMODULE_DIR}/dist/jquery.js

NQUERY    = ${npm_package_main}
M4_NQUERY = $(basename ${NQUERY}).m4$(suffix ${NQUERY})

.PHONY: build
build: ${NQUERY}

#.PHONY: publish
#publish:

${NQUERY}: ${JQUERY} ${M4_NQUERY} FORCE
	m4 --prefix-builtins --include $(dir ${JQUERY}) ${M4_NQUERY} > $@
	rm ${M4_NQUERY}

${JQUERY}: ${JQUERY_SUMODULE_DIR}
	${MAKE} -C $^

${JQUERY_SUMODULE_DIR}:
	git submodule update --init

${LIB}/%.js: ${SRC}/%.coffee
	coffee --compile --print $< > $@

.PHONY: test
test: build
	mocha

.PHONY: clean
clean:
	rm -Rf ${JQUERY_SUMODULE_DIR} ${M4_NQUERY} ${NQUERY}

FORCE:

.PHONY: debug
debug:
	@echo "debug"