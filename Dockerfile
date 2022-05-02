# Offical php-apache version
FROM php:8.1-apache

#ENVS
ENV APACHE_DIR /var/www/html
ENV API_REPO_NAME messagingapp-api
ENV FRONTEND_REPO_NAME messagingapp-frontend

#Install linux packages 
RUN apt update && apt upgrade -y
RUN apt install -y git zip nano libpq-dev -y && docker-php-ext-install pdo pdo_pgsql pgsql

## Front-end packages
#Install Node
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt -y install nodejs
RUN npm install && npm install -g yarn 

## Back-end packages
#Install composer
RUN curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
RUN HASH=`curl -sS https://composer.github.io/installer.sig`
RUN php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer

# Clone Repositories
RUN git clone https://github.com/lcubestudios/messagingapp-frontend.git 
RUN git clone https://github.com/lcubestudios/messagingapp-api.git

#Install front-end libraries
RUN cd ${APACHE_DIR}/${FRONTEND_REPO_NAME} && git checkout dev && touch .env
RUN cd ${APACHE_DIR}/${FRONTEND_REPO_NAME} && yarn && yarn build
RUN mv ${APACHE_DIR}/${FRONTEND_REPO_NAME}/dist/* ${APACHE_DIR}/

#Install backend libraries 
RUN cd ${APACHE_DIR}/${API_REPO_NAME} && composer install && touch .env

EXPOSE 80
