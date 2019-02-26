FROM skyrkt/craft3:3.1.14

COPY src/craft/config/general.php /usr/share/nginx/config/general.php
# COPY src/craft/config/license.key /usr/share/nginx/config/license.key
COPY src/craft/config/redactor /usr/share/nginx/config/redactor
COPY src/craft/rebrand /usr/share/nginx/storage/rebrand
# COPY src/craft/plugins /usr/share/nginx/craft/plugins/
COPY src/app /usr/share/nginx/templates/
COPY src/public /usr/share/nginx/web/

COPY .devops/docker-files/php.ini /etc/php/7.0/fpm/php.ini
COPY .devops/docker-files/15-expires.conf /opt/docker/etc/nginx/vhost.common.d/15-expires.conf
COPY .devops/docker-files/01-301.conf /opt/docker/etc/nginx/vhost.common.d/01-301.conf
COPY .devops/docker-files/vhost.conf /opt/docker/etc/nginx/vhost.conf

# WORKDIR /usr/share/nginx
# RUN chown -R www-data:www-data .
# RUN chmod -Rf 777 .
