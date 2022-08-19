
docker stop tomcat; docker rm tomcat
docker run -d --name tomcat -p 8080:8080 paasup/poc:tomcat-custom-homepage
