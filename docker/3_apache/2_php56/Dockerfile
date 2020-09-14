FROM php:5.6-apache

RUN apt-get update
RUN apt-get -y install less libicu-dev mysql-client libpq-dev libpng-dev \
    libfreetype6-dev libjpeg62-turbo-dev libpng-dev libwebp-dev \
    libxpm-dev wget libmagickwand-dev vim iputils-ping net-tools
RUN docker-php-ext-configure gd \
        --with-freetype-dir \
        --with-png-dir \
        --with-jpeg-dir \
        --with-gd \
        --with-xpm-dir \
        --with-webp-dir
RUN docker-php-ext-install pdo_mysql mysqli pdo_pgsql pgsql intl gd mbstring

# locale
RUN apt-get install -y locales \
  && echo "ja_JP UTF-8" >> /etc/locale.gen \
  && locale-gen

# xdebug
RUN pecl install xdebug-2.5.5

# imagick
RUN pecl install imagick
COPY ./imagick.ini /usr/local/etc/php/conf.d/

# memcached
RUN apt-get -y install libz-dev libmemcached-dev libmemcached11 libmemcachedutil2 build-essential \
&& pecl install memcached-2.2.0 \
&& echo extension=memcached.so >> /usr/local/etc/php/conf.d/memcached.ini

# git
RUN apt-get install -y git

# mhsendmail
RUN wget https://github.com/mailhog/mhsendmail/releases/download/v0.2.0/mhsendmail_linux_amd64
RUN chmod +x mhsendmail_linux_amd64
RUN mv mhsendmail_linux_amd64 /usr/local/bin/mhsendmail

# www
RUN ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load
RUN ln -s /etc/apache2/mods-available/vhost_alias.load /etc/apache2/mods-enabled

COPY ./apache2.conf /etc/apache2/apache2.conf
COPY ./000-default.conf /etc/apache2/sites-available/000-default.conf
COPY ./base.conf /etc/apache2/sites-available/base.conf
RUN a2ensite base.conf

# ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/ssl-cert-snakeoil.key -out /etc/ssl/certs/ssl-cert-snakeoil.pem -subj "/C=AT/ST=Vienna/L=Vienna/O=Security/OU=Development/CN=example.com"
COPY ./ssl.conf /etc/apache2/sites-available/ssl.conf
RUN a2ensite ssl.conf
RUN a2enmod ssl

# php
COPY ./php.ini /usr/local/etc/php/