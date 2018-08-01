[![CircleCI](https://circleci.com/gh/GSA/catalog-db.svg?style=svg)](https://circleci.com/gh/GSA/catalog-db)

# catalog-db
[See Main Project](https://github.com/GSA/catalog-app)

<a href="https://hub.docker.com/r/datagov/catalog-db/"><img src="http://dockeri.co/image/datagov/catalog-db" /></a>


## Development

When running this docker image locally, you can follow these steps.

Build the container.

    $ docker build -t catalog-db .

Then run the container on an alternative port.

    $ docker run -it -p 9000:5432 catalog-db

Connect from your localhost to test it.

    $ psql -p 9000 -U postgres -h localhost ckan


## Tests

Test are run in a `test` container that makes assertions against the built
image. This is done with docker-compose.

    $ make test
