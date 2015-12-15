FROM alpine:3.2

MAINTAINER <Matt Allen> matt@oberd.com

#install php and needed modules
RUN apk --update add php \
	php-json \
	php-gd \
	php-common \
	php-soap \
	php-mcrypt \
	php-mysqli \
	php-pdo \
	php-xml \
	php-curl \
	php-phar \
	php-pear \
	php-cli \
	php-openssl \
	php-pdo_mysql \
	php-dom


RUN apk add apache2 \
	php-apache2 \
	apache2-ssl \
	openssl \
	apache2-proxy

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && chmod +x /usr/local/bin/composer

ADD apache/deflate.conf /etc/apache2/conf.d/deflate.conf

RUN echo "ServerName localhost" >> /etc/apache2/httpd.conf && \
    sed -i "s/ServerAdmin.*/ServerAdmin admin@oberd.com/g" /etc/apache2/httpd.conf && \
    sed -i '/^#LoadModule filter_module/s/^#//' /etc/apache2/httpd.conf && \
    sed -i 's/^SSLMutex/#SSLMutex/' /etc/apache2/conf.d/ssl.conf

EXPOSE 80 443

ENTRYPOINT ["apachectl", "-D", "FOREGROUND"]
