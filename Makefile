MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules
MAKEFLAGS += --no-builtin-variables

SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
.SECONDEXPANSION:

export UID = $(shell id -u)
export GID = $(shell id -g)

DOCKER_COMPOSE ?= docker compose
RUN = $(DOCKER_COMPOSE) run --rm
GIT_ORIGIN_URL = $(shell git remote get-url origin)


ifdef GITLAB_CI
BUILD_ENV ?= gitlab
else ifdef GITHUB_ACTION
BUILD_ENV ?= github
else ifneq (,$(findstring github,$(GIT_ORIGIN_URL)))
BUILD_ENV ?= github
else ifneq (,$(findstring gitlab,$(GIT_ORIGIN_URL)))
BUILD_ENV ?= gitlab
else
BUILD_ENV ?= unspecified
endif

$(info BUILD_ENV=$(BUILD_ENV))

ifeq ($(BUILD_ENV),gitlab)
export DOCKER_BASE_IMAGE ?= registry.gitlab.com/gifnksm/docker-mdbook-ja:latest
else ifeq ($(BUILD_ENV),github)
export DOCKER_BASE_IMAGE ?= ghcr.io/gifnksm/mdbook-ja:latest
else
$(warning BUILD_ENV invalid or unspecified or undetectable)
export DOCKER_BASE_IMAGE ?= ghcr.io/gifnksm/mdbook-ja:latest
endif

.PHONY: default
default: build


## Build a book from source files (default target)
.PHONY: build
build: run-docker-compose-build
	$(RUN) mdbook build

## Delete a built book
.PHONY: clean
clean: run-docker-compose-build
	$(RUN) mdbook clean

## Watch book source files and rebuild a book on changes
.PHONY: watch
watch: run-docker-compose-build
	$(RUN) mdbook watch || true

## Serve a book at http://localhost:3000/, and rebuild it on changes
.PHONY: serve
serve: run-docker-compose-build
	$(DOCKER_COMPOSE) up mdbook || true


## Pull the latest version of Docker images
.PHONY: pull
pull: run-docker-compose-pull-build

.PHONY: run-docker-compose-build
run-docker-compose-build:
	$(DOCKER_COMPOSE) build

.PHONY: run-docker-compose-pull-build
run-docker-compose-pull-build:
	$(DOCKER_COMPOSE) build --pull

# if package.json exist, pull target invokes install-lint-tools after run-docker-compose-pull-build
ifneq ("$(wildcard package.json)", "")
pull: install-lint-tools
install-lint-tools: run-docker-compose-pull-build
endif


## Setup config files for Docker Compose
.PHONY: setup-docker-compose
setup-docker-compose: .env

.env: FORCE
	echo "UID=$(UID)" > $@
	echo "GID=$(GID)" >> $@
	echo "DOCKER_BASE_IMAGE=$(DOCKER_BASE_IMAGE)" >> $@


## Install lint tools to host environment
.PHONY: install-lint-tools
install-lint-tools: package.json package-lock.json run-npm-install

package.json package-lock.json: run-docker-compose-build FORCE
	$(RUN) exec cp /npm/$@ $@

.PHONY: run-npm-install
run-npm-install: package.json package-lock.json
	npm ci


## Run linters/tests on book source files
.PHONY: check
check: build check-markdown check-textlint check-mdbook

## Run markdownlint on book source files
.PHONY: check-markdown
check-markdown: run-docker-compose-build
	$(RUN) markdownlint .

## Run textlint on book source files
.PHONY: check-textlint
check-textlint: run-docker-compose-build
	$(RUN) textlint .

## Run tests that Rust codes in a book compile without errors
.PHONY: check-mdbook
check-mdbook: run-docker-compose-build
	$(RUN) mdbook test


## Fix basic errors in book source files
.PHONY: fix
fix: fix-markdown fix-textlint

## Fix basic errors in book source files with markdownlint
.PHONY: fix-markdown
fix-markdown: run-docker-compose-build
	$(RUN) markdownlint --fix .

## Fix basic errors in book source files with textlint
.PHONY: fix-textlint
fix-textlint: run-docker-compose-build
	$(RUN) textlint --fix .


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
			printf "  \x1b[32;01m%-24s\x1b[0m %s\n", helpCommand, helpMessage; \
		} \
	} \
	{ \
		if ($$0 !~ /^.PHONY/) { \
			lastLine = $$0 \
		} \
	} \
	' $(MAKEFILE_LIST) | sort -u
	@printf "\n"

.PHONY: FORCE
FORCE:
