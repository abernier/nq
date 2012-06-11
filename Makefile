JQUERY_SUMODULE_DIR = lib/jquery
JQUERY              = ${JQUERY_SUMODULE_DIR}/dist/jquery.js

#M4_NQUERY = $(shell mktemp "${TMPDIR}nQuery.XXXXXX")
M4_NQUERY = lib/index.m4.js
NQUERY    = ${npm_package_main}

build: ${NQUERY}

#publish:

${NQUERY}: ${JQUERY} FORCE
	coffee --compile --output lib/ src/
	m4 --prefix-builtins --include $(dir ${JQUERY}) ${M4_NQUERY} > $@
	rm ${M4_NQUERY}

${JQUERY}: ${JQUERY_SUMODULE_DIR}
	${MAKE} -C $^

${JQUERY_SUMODULE_DIR}:
	git submodule update --init

.PHONY: test
test: build
	mocha

.PHONY:
clean:
	rm -Rf ${JQUERY_SUMODULE_DIR} ${M4_NQUERY} ${NQUERY} ${NODE_MODULES}

FORCE: