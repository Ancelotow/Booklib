FROM openjdk:8-jdk-alpine
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
COPY docker-entrypoint-initdb.d /docker-entrypoint-initdb.d
ENTRYPOINT ["java","-jar","/app.jar"]

