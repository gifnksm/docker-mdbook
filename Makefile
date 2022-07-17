MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules
MAKEFLAGS += --no-builtin-variables

SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
.SECONDEXPANSION:

export UID = $(shell id -u)
export GID = $(shell id -g)

DOCKER_COMPOSE = docker compose
RUN = $(DOCKER_COMPOSE) run --rm

.PHONY: default
default: build

## Build a book from source files (default target)
.PHONY: build
build:
	$(RUN) mdbook build

## Delete a built book
.PHONY: clean
clean:
	$(RUN) mdbook clean

## Watch book source files and rebuild a book on changes
.PHONY: watch
watch:
	$(RUN) mdbook watch

## Serve a book at http://localhost:3000/, and rebuild it on changes
.PHONY: serve
serve: mdbook-serve
	$(DOCKER_COMPOSE) up mdbook

## Run all linters on book source files
.PHONY: lint
lint: lint-markdown

## Run markdownlint on book source files
.PHONY: lint-markdown
lint-markdown:
	$(RUN) markdownlint .

## Run all tests on book source files
.PHONY: test
test: test-mdbook

## Test that Rust codes in a book compile without errors
.PHONY: test-mdbook
test-mdbook:
	$(RUN) mdbook test

## Print this message
help:
	@printf "Available targets:\n\n"
	@awk '/^[a-zA-Z\-_0-9%:\\]+/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = $$1; \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			gsub("\\\\", "", helpCommand); \
			gsub(":+$$", "", helpCommand); \
			printf "  \x1b[32;01m%-16s\x1b[0m %s\n", helpCommand, helpMessage; \
		} \
	} \
	{ \
		if ($$0 !~ /^.PHONY/) { \
			lastLine = $$0 \
		} \
	} \
	' $(MAKEFILE_LIST) | sort -u
	@printf "\n"
