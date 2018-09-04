[![CircleCI](https://circleci.com/gh/GSA/catalog-db.svg?style=svg)](https://circleci.com/gh/GSA/catalog-db)

# catalog-db
[See Main Project](https://github.com/GSA/catalog-app)

<a href="https://hub.docker.com/r/datagov/catalog-db/"><img src="http://dockeri.co/image/datagov/catalog-db" /></a>

Database and extension versions are chosen to match [AWS's RDS offering](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_PostgreSQL.html#CHAP_PostgreSQL.Extensions.SupportedPerVersion).


## Development

When running this docker image locally, you can follow these steps.

Build the container.

    $ make build

Start the container.

    $ make start

With the db container started, connect to the database from a new terminal.

    $ make psql
    docker-compose exec db psql -U postgres ckan
    psql (10.4 (Debian 10.4-2.pgdg90+1), server 9.3.23)
    Type "help" for help.

    ckan=#

Bring the db container down.

    $ make clean


## Tests

Test are run in a `test` container that makes assertions against the built
image.

    $ make test
