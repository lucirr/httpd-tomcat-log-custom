
docker stop httpd; docker rm httpd
docker run -d --name httpd -p 8081:80 paasup/httpd-custom:homepage
