# catalog-db
[See Main Project](https://github.com/GSA/catalog-app)

<a href="https://hub.docker.com/r/datagov/catalog-db/"><img src="http://dockeri.co/image/datagov/catalog-db" /></a>


To Fix:
current sql is used to grant ckan permissions to postgis tables, need to figure out why bash this bash throws errors
```
psql -U $POSTGRES_USER -d ${DB_PYCSW_DB} -c "CREATE EXTENSION postgis;" && \
psql -U $POSTGRES_USER -d ${DB_CKAN_DB} -c "CREATE EXTENSION postgis;" && \
```


## Development

When running this docker image locally, you can follow these steps.

Build the container.

    $ docker build -t catalog-db .

Then run the container on an alternative port.

    $ docker run -it -p 9000:5432 catalog-db

Connect from your localhost to test it.

    $ psql -p 9000 -U postgres -h localhost ckan


## CI

The tests are run on CI. We build the container, then create a test container in
order to test it. The test container is a simple postgres container containing
`psql` and our test script.
