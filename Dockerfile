FROM php:7.0-fpm

MAINTAINER SockyJam<sockyjam@126.com>


RUN apt-get update -y

RUN apt-get install -y curl \
                          git \
                          libfreetype6-dev \
                          libjpeg62-turbo-dev \
                          libmcrypt-dev \
                          libpng-dev 

RUN docker-php-ext-install -j$(nproc) iconv mcrypt pdo_mysql \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd 
