# Christopher Neal's Project1 Dockerfile
FROM openjdk:12-alpine

COPY target/simple-java-maven-app-1.0-RELEASE.jar /simple-java-maven-app-1.0-RELEASE.jar

EXPOSE 8888

CMD ["java", "-jar", "simple-java-maven-app-1.0-RELEASE.jar"]
