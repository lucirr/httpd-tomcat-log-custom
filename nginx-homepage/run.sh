
docker stop nginx; docker rm nginx
#docker run -d --name nginx -p 8180:80 paasup/poc:nginx-custom-homepage
docker run -d --network="host" --name nginx paasup/poc:nginx-custom-homepage
