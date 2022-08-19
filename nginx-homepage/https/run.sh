
docker stop nginx; docker rm nginx
docker run -d -p 80:80 -p 443:443 --name nginx paasup/poc:nginx-custom-homepage
