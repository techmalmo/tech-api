.PHONY: test

test:
	go test ./... -v -race

install:
	go mod vendor

# TODO: migrate... seed...
