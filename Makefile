.PHONY: build test

export HOST ?= $(shell hostname)
export HOSTNAME ?= $(HOST)

build: goile

goile: goile.go goile.c
	@go build

test: build
	@echo "should output: $(HOSTNAME)"
	@./hostname.scm
