FROM tomcat:9.0.65-jdk8

ENV TZ=Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime

# tomcat logging to pod name directory
# Add at runtime the following line: ENV JAVA_OPTS="${JAVA_OPTS} -Dhostname=$HOSTNAME"
COPY setenv.sh /usr/local/tomcat/bin/ 
COPY catalina.sh /usr/local/tomcat/bin/ 
COPY server.xml /usr/local/tomcat/conf/ 

RUN rm -Rf /usr/local/tomcat/conf/logging.properties
RUN rm -Rf /usr/local/tomcat/webapps.dist

COPY sp-homePage.war /usr/local/tomcat/webapps/homepage.war
