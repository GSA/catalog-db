# catalog-db
[See Main Project](https://github.com/GSA/catalog-app)

<a href="https://hub.docker.com/r/datagov/catalog-db/"><img src="http://dockeri.co/image/datagov/catalog-db" /></a>


To Fix:
current sql is used to grant ckan permissions to postgis tables, need to figure out why bash this bash throws errors
```
psql -U $POSTGRES_USER -d ${DB_PYCSW_DB} -c "CREATE EXTENSION postgis;" && \
psql -U $POSTGRES_USER -d ${DB_CKAN_DB} -c "CREATE EXTENSION postgis;" && \
```