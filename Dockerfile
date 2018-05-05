# Use an official PHP Cli runtime as a parent image
FROM php:7.2-cli
MAINTAINER Aurélien Lair (aurelien.lair@nomail.com)

RUN  apt-get update -y && \
     apt-get upgrade -y && \
     apt-get dist-upgrade -y && \
     apt-get -y autoremove && \
     apt-get clean

RUN apt-get install -y \
    less \
	zip \
    unzip \
	git \
    wget \
    vim \
	python-pygments

#Dependency of onebip-clock 
RUN pecl install mongodb-1.4.3
RUN echo "extension=mongodb.so" >> /usr/local/etc/php/conf.d/mongodb.ini

RUN php -r "readfile('https://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer \
    && rm -rf /var/lib/apt/lists/*

COPY ./config/.vimrc ~/
COPY . /usr/src/php-docker
WORKDIR /usr/src/php-docker

RUN composer install --no-interaction -o
RUN wget https://raw.githubusercontent.com/aurelienlair/dotfiles/master/.lessfilter -P ~/
RUN chmod a+x ~/.lessfilter
RUN cat ./config/bash-tools.sh >> ~/.bashrc
RUN mkdir -p ~/.vim/backup
RUN mkdir -p ~/.vim/tmp
