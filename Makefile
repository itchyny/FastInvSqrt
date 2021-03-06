.PHONY: all
all: build

.PHONY: build
build: script/build/validate
	@bash script/build.sh

script/build/validate: script/validate.c
	@mkdir -p script/build
	@gcc $< -o $@ -lm

.PHONY: test
test: build
	@bash script/test.sh

.PHONY: clean
clean:
	@bash script/clean.sh
	@rm -rf script/build
