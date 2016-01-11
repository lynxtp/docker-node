CONTAINER = lynxtp/node
VERSION = 5.9.0

DOCKER ?= docker

.PHONY = build clean test

build: .built

.built: Dockerfile
	@$(DOCKER) build -t $(CONTAINER):$(VERSION) .
	@touch $@

test: build
	@./check-node-version.sh $(VERSION)

clean:
	@rm -f .built
