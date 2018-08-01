FROM postgres:9.3

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

# Install required packages
RUN apt-get -q -y update && apt-get -q -y install \
        postgis \
        postgresql-9.3-postgis-2.3 \
        postgresql-client

COPY ./prepare_db.sh /docker-entrypoint-initdb.d

#VOLUME /var/lib/postgresql/data

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 5432
CMD ["postgres"]
