.PHONY: all build test

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
	docker-compose down
