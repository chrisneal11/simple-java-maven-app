# Christopher Neal's Project1 Dockerfile
FROM tomcat:latest

EXPOSE 8888

COPY target/*.jar /usr/local/tomcat/webapps
