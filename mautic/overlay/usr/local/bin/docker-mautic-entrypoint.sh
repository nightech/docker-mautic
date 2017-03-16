#!/usr/bin/env bash

set -e

if [ ! -L /var/www/mautic/media/files ]; then
    if [ ! -d /var/www/mautic/volumes/files ]; then
        mv /var/www/mautic/media/files /var/www/mautic/volumes/
    else
        rm -rf /var/www/mautic/media/files
    fi

    ln -s /var/www/mautic/volumes/files /var/www/mautic/media/files
fi

if [ ! -L /var/www/mautic/media/images ]; then
    if [ ! -d /var/www/mautic/volumes/images ]; then
        mv /var/www/mautic/media/images /var/www/mautic/volumes/
    else
        rm -rf /var/www/mautic/media/images
    fi

    ln -s /var/www/mautic/volumes/images /var/www/mautic/media/images
fi

if [ ! -L /var/www/mautic/translations ]; then
    if [ ! -d /var/www/mautic/volumes/translations ]; then
        mv /var/www/mautic/translations /var/www/mautic/volumes/
    else
        rm -rf /var/www/mautic/translations
    fi

    ln -s /var/www/mautic/volumes/translations /var/www/mautic/translations
fi

if [ ! -L /var/www/mautic/app/config/local.php ]; then
    mkdir -p /var/www/mautic/volumes/config

    if [ -f /var/www/mautic/app/config/local.php ]; then
        mv /var/www/mautic/app/config/local.php /var/www/mautic/volumes/config
    elif [ ! -f /var/www/mautic/volumes/config/local.php ]; then
        echo "<?php \$parameters = array(); ?>" > /var/www/mautic/volumes/config/local.php
    fi

    ln -s /var/www/mautic/volumes/config/local.php /var/www/mautic/app/config/local.php
fi

# Let's user to migration himself
# /usr/local/bin/php /var/www/mautic/app/console doctrine:migrations:migrate --no-interaction
# /usr/local/bin/php /var/www/mautic/app/console --env=prod cache:clear

chown -R www-data:www-data /var/www/mautic

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
    set -- php "$@"
fi

exec "$@"
