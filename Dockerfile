FROM postgres:9.5

ARG DB_CKAN_USER=ckan
ARG DB_CKAN_PASSWORD=ckan_password
ARG DB_CKAN_DB=ckan
ARG DB_PYCSW_DB=pycsw
ARG POSTGRES_USER=postgres

ENV DB_CKAN_USER ${DB_CKAN_USER}
ENV DB_CKAN_PASSWORD ${DB_CKAN_PASSWORD}
ENV DB_CKAN_DB ${DB_CKAN_DB}
ENV DB_PYCSW_DB ${DB_PYCSW_DB}
ENV POSTGRES_USER ${POSTGRES_USER}
ENV POSTGRES_VERSION_MAJOR 9.5
ENV POSTGIS_VERSION_MAJOR 2.3

# Install required packages
RUN apt-get -q -y update && apt-get -q -y install \
        postgis \
        postgresql-${POSTGRES_VERSION_MAJOR}-postgis-2.3 \
        postgresql-${POSTGRES_VERSION_MAJOR}-postgis-2.4 \
        postgresql-client

COPY ./prepare_db.sh /docker-entrypoint-initdb.d

#VOLUME /var/lib/postgresql/data

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 5432
CMD ["postgres"]
