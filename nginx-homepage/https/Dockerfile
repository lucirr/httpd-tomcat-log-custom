FROM nginx:latest

COPY default-https.conf /etc/nginx/conf.d/

RUN mkdir -p /etc/nginx/ssl
COPY cert.pem /etc/nginx/ssl/
COPY key.pem /etc/nginx/ssl/
