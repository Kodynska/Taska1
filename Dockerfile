#FROM golang:1.4
#
#RUN mkdir -p /go/src/app
#WORKDIR /go/src/app
#
## this will ideally be built by the ONBUILD below ;)
#CMD ["go-wrapper", "run"]
#
#ONBUILD COPY . /go/src/app
#ONBUILD RUN go-wrapper download
#ONBUILD RUN go-wrapper install
# Dockerfile
#FROM nginx:alpine
#VOLUME /usr/share/nginx/html
#EXPOSE 80
FROM php:7.3-apache
RUN apt-get update \
    && apt-get install -y git
RUN docker-php-ext-install pdo pdo_mysql mysqli
RUN a2enmod rewrite
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --install-dir=. --filename=composer
RUN mv composer /usr/local/bin/
COPY src/ /var/www/html/
EXPOSE 80
