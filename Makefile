.PHONY: all build test

BRANCH := $(shell git symbolic-ref --short -q HEAD)
TAG := datagov/catalog-db:$(BRANCH)

all: build

build:
	docker-compose build

start:
	docker-compose up db

psql:
	docker-compose exec db psql -U postgres ckan

test:
	docker-compose up --abort-on-container-exit

clean:
	docker-compose down -v

tag:
	echo "Tagging as $(TAG)"
	docker build . -t $(TAG)
