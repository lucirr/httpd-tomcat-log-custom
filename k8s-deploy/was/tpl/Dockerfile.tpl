FROM tomcat:9.0.65-jdk8

ENV TZ=Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime

# tomcat logging to pod name directory
COPY logging.properties /usr/local/tomcat/conf/ 
# Add at runtime the following line: ENV JAVA_OPTS="${JAVA_OPTS} -Dhostname=$HOSTNAME"
COPY setenv.sh /usr/local/tomcat/bin/ 

RUN rm -Rf /usr/local/tomcat/webapps/ROOT
RUN rm -Rf /usr/local/tomcat/webapps/docs
RUN rm -Rf /usr/local/tomcat/webapps/examples
RUN rm -Rf /usr/local/tomcat/webapps/host-manager
RUN rm -Rf /usr/local/tomcat/webapps/manager

# Copy source war into webapp dir with context path name (ex. homepage.war)
# 
# COPY sp-homePage.war /usr/local/tomcat/webapps/homepage.war
