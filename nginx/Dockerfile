FROM nginx:1.13.3

RUN chown -R root:www-data /usr/bin/

CMD sh /usr/bin/docker-nginx-entrypoint.sh && nginx -g 'daemon off;'

EXPOSE 80 443