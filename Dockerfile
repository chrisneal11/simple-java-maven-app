# Christopher Neal's Project1 Dockerfile
FROM java:8-jdk-alpine
RUN MKDIR /usr/app
COPY ./target/my-app-1.0-SNAPSHOT.jar /usr/app
WORKDIR /usr/app
EXPOSE 8888
ENTRYPOINT ["java", "-jar", "my-app-1.0-SNAPSHOT.jar"]
