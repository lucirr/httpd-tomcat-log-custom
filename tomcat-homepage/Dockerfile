FROM paasup/tomcat-custom:9.0.65-jdk8

COPY sp-homePage.war /usr/local/tomcat/webapps/homepage.war

RUN mkdir -p /app
COPY Config.properties /app/
