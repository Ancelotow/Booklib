FROM postgres:10.10
ENV SPRING_DATASOURCE_URL jdbc:postgresql://db:5432/booklib
ENV SPRING_DATASOURCE_USERNAME postgres
ENV SPRING_DATASOURCE_PASSWORD postgres
ENV SPRING_JPA_HIBERNATE_DDL_AUTO update
COPY init.sql /docker-entrypoint-initdb.d/init.sql
EXPOSE 5432
