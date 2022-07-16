export UID = $(shell id -u)
export GID = $(shell id -g)

DOCKER_COMPOSE = docker compose
RUN = $(DOCKER_COMPOSE) run --rm

build: build-mdbook
.PHONY: build

lint: lint-markdown
.PHONY: lint

serve: serve-mdbook
.PHONY:

watch: watch-mdbook
.PHONY: watch


build-mdbook:
	$(RUN) mdbook build
.PHONY: build-mdbook

lint-markdown:
	$(RUN) markdownlint .
.PHONY: lint-markdown

serve-mdbook:
	$(DOCKER_COMPOSE) up mdbook
.PHONY: serve-mdbook

watch-mdbook:
	$(RUN) mdbook watch
.PHONY: watch-mdbook
