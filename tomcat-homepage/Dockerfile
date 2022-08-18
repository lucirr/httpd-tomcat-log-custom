FROM paasup/tomcat-custom:9.0.26-jdk8-openjdk-slim

COPY sp-homePage.war /usr/local/tomcat/webapps/homepage.war

RUN mkdir -p /app
COPY Config.properties /app/
