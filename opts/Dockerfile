FROM php:7.3-apache

COPY sites-available/apache.conf /etc/apache2/sites-available/000-default.conf

# enable apache modules
RUN a2enmod expires headers rewrite

# install extensions
RUN apt-get update -q && apt-get install -qy \
       libfreetype6-dev \
       libjpeg62-turbo-dev \
       libmcrypt-dev \
       libpng-dev \
       libzip-dev \
       libxml2-dev \
       unzip \
       dos2unix \
       zlib1g-dev \
       libicu-dev \
       libcurl4-openssl-dev \
       pkg-config \
       libssl-dev \
       tzdata \
       cron \
       nano \
       g++ \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd pdo_mysql zip mysqli

RUN docker-php-ext-install xml
RUN docker-php-ext-install xmlrpc
RUN docker-php-ext-install xmlwriter
RUN docker-php-ext-install intl

#RUN pecl install mongodb
#RUN docker-php-ext-install bcmath
#RUN echo "extension=mongodb.so" >> /usr/local/etc/php/conf.d/mongodb.ini

ENV COMPOSER_HOME /composer
ENV PATH ./vendor/bin:/composer/vendor/bin:$PATH
ENV COMPOSER_ALLOW_SUPERUSER 1
RUN curl -s https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer
ENV TZ Asia/Ho_Chi_Minh
RUN ln -snf /usr/share/zoneinfo/$TZ && echo $TZ > /etc/timezone
RUN docker-php-ext-install exif

## start apache
CMD ["apache2-foreground"]


