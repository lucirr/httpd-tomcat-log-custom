
docker stop tomcat; docker rm tomcat
docker run -d --name tomcat -p 8080:8080 -e JAVA_OPTS="${JAVA_OPTS} -Dhostname=$HOSTNAME" paasup/tomcat-custom:helloworld
