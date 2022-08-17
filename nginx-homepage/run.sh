
docker stop nginx; docker rm nginx
#docker run -d --name nginx -p 8180:80 paasup/nginx-custom:homepage
docker run -d --network="host" --name nginx paasup/nginx-custom:homepage
