.PHONY: all
all: build

./node_modules/.bin/coffee \
./node_modules/.bin/mocha:
	npm install -d

lib/jquery:
	@git submodule update --init

lib/jquery/dist/jquery.js: lib/jquery
	@make -C lib/jquery

.PHONY: build
build: lib/jquery/dist/jquery.js ./node_modules/.bin/coffee
	@./node_modules/.bin/coffee --compile --output lib/ src/
	@m4 --prefix-builtins --include lib/jquery/dist lib/index.m4.js > lib/index.js
	@rm lib/index.m4.js

.PHONY: test
test: build ./node_modules/.bin/mocha
	@./node_modules/.bin/mocha