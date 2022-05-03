GOPATH:=$(shell go env GOPATH)
user:=${user}
pwd:=${pwd}
tag:=${tag}

.PHONY: build
build:
	GOOS=linux go build -tags netgo  -o  runapp .

.PHONY: test
test:
	go test -v ./... -cover

.PHONY: docker
docker:
	docker build . -t scg130/hello-world:${tag}

.PHONY: push
push:
	docker login -u ${user} -p ${pwd}
	docker push scg130/hello-world:${tag}