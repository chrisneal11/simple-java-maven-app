# Christopher Neal's Project1 Dockerfile
FROM tomcat

COPY target/*.jar /usr/local/tomcat/webapps
