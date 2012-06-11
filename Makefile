NODE_MODULES = ./node_modules
COFFEE       = ${NODE_MODULES}/.bin/coffee
MOCHA        = ${NODE_MODULES}/.bin/mocha

JQUERY_SUMODULE_DIR = lib/jquery
JQUERY              = ${JQUERY_SUMODULE_DIR}/dist/jquery.js

M4_NQUERY = lib/index.m4.js
NQUERY    = lib/index.js

#INDEX_M4_JS = $(shell mktemp "${TMPDIR}nQuery.XXXXXX")

.PHONY: all
all: ${NQUERY}

${NODE_MODULES}:
	npm install -d

${COFFEE} \
${MOCHA}: ${NODE_MODULES}

${NQUERY}: ${JQUERY} ${COFFEE} FORCE
	$(info "Compiling src/")
	@${COFFEE} --compile --output lib/ src/

	$(info "Pre-processing")
	@m4 --prefix-builtins --include $(dir ${JQUERY}) ${M4_NQUERY} > $@

	$(info "Cleaning")
	@rm ${M4_NQUERY}

${JQUERY}: ${JQUERY_SUMODULE_DIR}
	@${MAKE} -C $^

${JQUERY_SUMODULE_DIR}:
	@git submodule update --init

.PHONY: test
test: build ${MOCHA}
	@${MOCHA}

.PHONY:
clean:
	rm -Rf ${JQUERY_SUMODULE_DIR} ${M4_NQUERY} ${NQUERY} ${NODE_MODULES}

FORCE: