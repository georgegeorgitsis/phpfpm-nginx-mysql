#!/bin/bash

echo "Setting variables into default.conf..."

set -a
. /usr/share/envfile
set +a

MYVARS='$NGINX_HOST:$MAC_KEY:$CRYPTO_KEY:$APPLICATION_ENV:$PRIVATE_LABEL'
envsubst "$MYVARS" < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

echo "Variables set"