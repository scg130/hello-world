GOPATH:=$(shell go env GOPATH)

.PHONY: build
build:
	GOOS=linux go build  -o  runapp .

.PHONY: test
test:
	go test -v ./... -cover

.PHONY: docker
docker:
	docker build . -t scg130/demo:latest

.PHONY: push
push:
	docker push scg130/demo