FROM nightech/php-fpm:7.0

ENV EXT_IMAP "on"
ENV EXT_INTL "on"
ENV EXT_MCRYPT "on"
ENV EXT_MYSQL "on"
ENV EXT_REDIS "on"
ENV EXT_SOCKETS "on"
ENV EXT_ZIP "on"

ENV MAUTIC_VERSION 2.8.0

RUN /usr/local/bin/docker-entrypoint.sh

RUN cd /var/www && \
    curl -O -L https://github.com/mautic/mautic/archive/${MAUTIC_VERSION}.tar.gz && \
    tar -xf ${MAUTIC_VERSION}.tar.gz && \
    mv mautic-${MAUTIC_VERSION} mautic && \
    rm ${MAUTIC_VERSION}.tar.gz && \
    cd /var/www/mautic && \
    composer --no-interaction --optimize-autoloader --no-scripts --no-dev --no-progress install

COPY ./overlay/ /

VOLUME /var/www/mautic
WORKDIR /var/www/mautic

ENTRYPOINT ["docker-mautic-entrypoint.sh"]
CMD ["php-fpm"]
