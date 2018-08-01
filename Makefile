.PHONY: all build test

all: build

build:
	docker build -t catalog-db .

test:
	docker-compose -f docker-compose.test.yml build
	docker-compose -f docker-compose.test.yml up test
