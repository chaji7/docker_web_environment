FROM ubuntu:12.04
#MAINTAINER Your Name <your@email.com>

#VOLUME ["/var/www"]

ENV DEBIAN_FRONTEND noninteractive

# PHP 5.3 + Apache で必要なパッケージをインストール
RUN apt-get -qq update \
    && apt-get install -y -qq --no-install-recommends \
      apache2 \
      libapache2-mod-php5 \
      php5 php5-dev php5-mysql php-pear php5-xdebug \
      vim iputils-ping net-tools \
      less libicu-dev mysql-client libpq-dev libpng-dev wget libmagickwand-dev libcurl3-openssl-dev \
      aptitude

COPY run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run

# locale
RUN apt-get install -y locales \
  && echo "ja_JP UTF-8" >> /etc/locale.gen \
  && locale-gen

# xdebug
RUN pecl install xdebug-2.2.7

# imagick
RUN apt-get install -y php5-imagick libmagickwand-dev libmagickcore-dev

# memcached
RUN apt-get install -y php5-memcached

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
RUN a2enmod headers

# ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/ssl-cert-snakeoil.key -out /etc/ssl/certs/ssl-cert-snakeoil.pem -subj "/C=AT/ST=Vienna/L=Vienna/O=Security/OU=Development/CN=example.com"
COPY ./default-ssl /etc/apache2/sites-available/default-ssl
#RUN a2ensite ssl.conf
#RUN a2enmod ssl

# php
RUN  mkdir /usr/local/etc/php
#COPY ./php.ini /usr/local/etc/php/
COPY ./php.ini /etc/php5/apache2

EXPOSE 80
CMD ["/usr/local/bin/run"]
