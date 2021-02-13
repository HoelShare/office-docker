#!/usr/bin/env bash

rm /etc/nginx/conf.d/*.conf
echo "$APP_URL"
sed "s|APP_URL|$APP_URL|" /etc/nginx/default.conf > /etc/nginx/conf.d/default.conf

if [[ ! -z "$USE_SSL" ]]; then
    sed "s|APP_URL|$APP_URL|" /etc/nginx/default-ssl.conf > /etc/nginx/conf.d/default-ssl.conf
fi
