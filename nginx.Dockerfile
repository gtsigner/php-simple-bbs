FROM nginx:1.13.3

COPY ./app /app

#SSH
COPY ./dockerfiles/nginx/certs /etc/nginx/certs

COPY ./dockerfiles/nginx/nginx.conf /etc/nginx/nginx.conf
#config.d
COPY ./dockerfiles/nginx/conf.d /etc/nginx/conf.d

WORKDIR /app
