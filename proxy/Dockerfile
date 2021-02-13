FROM nginx:latest

ENV APP_URL=http://localhost
COPY default.conf /etc/nginx/
COPY default-ssl.conf /etc/nginx/
COPY common.conf /etc/nginx
COPY common_location.conf /etc/nginx
COPY ssl.conf /etc/nginx
COPY dhparams.pem /etc/nginx

COPY start.sh /docker-entrypoint.d/create-vhost.sh