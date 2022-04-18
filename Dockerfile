# Offical php-apache version
FROM php:8.1-apache

#ENVS
ENV APACHE_DIR /var/www/html
ENV API_REPO_NAME messagingapp-api

#Install required packages 
RUN apt update && apt upgrade -y
RUN apt install -y git zip nano libpq-dev -y && docker-php-ext-install pdo pdo_pgsql pgsql

#Install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer

#Clone github repo
RUN cd /tmp && git clone https://github.com/lcubestudios/messagingapp-api.git 
#RUN cp -R /tmp/${API_REPO_NAME} ${APACHE_DIR}/

#Create new user change ownership of working directory
# RUN useradd -M webuser && chown -R webuser:webuser /var/www/html
# RUN cd ${APACHE_DIR}/api/${API_REPO_NAME} && composer install

EXPOSE 80