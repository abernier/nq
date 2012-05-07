.PHONY: devDependencies
devDependencies:
	npm install -d

lib/jquery:
	@git submodule update --init

lib/jquery/dist/jquery.js: lib/jquery
	@make -C lib/jquery

.PHONY: build
build: lib/jquery/dist/jquery.js devDependencies
	@./node_modules/.bin/coffee --compile --output lib/ src/

.PHONY: test
test: build
	@open test/index.html