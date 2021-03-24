# Christopher Neal's Project1 Dockerfile
FROM java:8-jdk-alpine
COPY ./target/*.jar /usr/app
WORKDIR /usr/app
EXPOSE 8888
ENTRYPOINT ["java", "-jar", "my-app-1.0-SNAPSHOT.jar"]
