FROM openjdk:8-jdk-alpine
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
COPY ./init.sql /docker-entrypoint-initdb.d/init.sql
ENTRYPOINT ["java","-jar","/app.jar"]
EXPOSE 8080

