#FROM postgres:9.6
FROM mdillon/postgis
MAINTAINER Data.gov

# Default user/pass/db overwritten by docker-compose
ENV DB_CKAN_USER ckan
ENV DB_CKAN_PASSWORD ckan_password
ENV DB_CKAN_DB ckan
ENV DB_PYCSW_DB pycsw

# Include datastore setup scripts
ADD ./docker-entrypoint-initdb.d /docker-entrypoint-initdb.d

EXPOSE 5432

