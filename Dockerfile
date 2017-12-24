FROM wordpress:latest

MAINTAINER Pedro Pereira <pedrogoncalvesp.95@gmail.com>

# Install some packages
RUN apt-get update && \
    apt-get -y install software-properties-common && \
	apt-get install -y git && \
	docker-php-ext-install zip mysqli pdo pdo_mysql

# Set extra PHP.ini settings
RUN { \
        echo 'date.timezone="America/Sao_Paulo"'; \
        echo 'log_errors=Off'; \
        echo 'max_execution_time=4000'; \
        echo 'max_input_vars=10000'; \
        echo 'max_input_time=40000'; \
        echo 'memory_limit=512M'; \
        echo 'post_max_size=20M'; \
        echo 'upload_max_filesize=20M'; \
    } > /usr/local/etc/php/conf.d/php-extra.ini

COPY apache2-custom /usr/local/bin
RUN chmod +x /usr/local/bin/apache2-custom

CMD ["apache2-custom"]
