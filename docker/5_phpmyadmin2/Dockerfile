FROM phpmyadmin/phpmyadmin:latest

RUN apt-get update
RUN apt-get -y install vim iputils-ping net-tools

# php.ini
RUN echo post_max_size\ =\ 200M\\nupload_max_filesize\ =\ 150M\\n >> /usr/local/etc/php/conf.d/phpmyadmin-misc.ini
