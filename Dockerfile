# Christopher Neal's Project1 Dockerfile
FROM openjdk:12-alpine

COPY ./target/my-app-1.0-SNAPSHOT.jar /my-app-1.0-SNAPSHOT.jar

EXPOSE 8888

CMD ["java", "-jar", "my-app-1.0-SNAPSHOT.jar"]
