.PHONY: build test

export HOST ?= $(shell hostname)
export HOSTNAME ?= $(HOST)

export CGO_ENABLED := 0
export GOOS := darwin
export GOAECH := amd64

build: goile vendor/guile/Makefile

goile: goile.go goile.c
	@go build

vendor/guile/Makefile: vendor/guile/configure
	cd $(dir $^); .$(notdir $^)

vendor/guile/configure: vendor/guile/autogen.sh
	cd $(dir $^); .$(notdir $^)

vendor/guile/autogen.sh:
	git submodule update --init

test: build
	@echo "should output: $(HOSTNAME)"
	@./hostname.scm

clean:
	rm -f goile
