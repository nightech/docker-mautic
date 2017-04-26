# Docker Mautic

Dockerfile for Mautic 2.8.0

## Features
* `docker-composer up --build` file for quickstart
* 2 images : 
  * `nightech/mautic:php-fpm` 
  * `nightech/mautic:cron`

## Install 
```bash
# Since the local.php config is already available, installer won't lanch
# In order to access to the installer & create the database & first user
# We need to connect to the mautic fpm running container 
docker-compose exec teamware_mautic_1 bash 

# remove the originial local.php symlink  
mv /var/www/mautic/app/config/local.php /var/www/mautic/app/config/_local.php

# browse http://localhost:8080 & complete the install

# move the generated local.php to volumes in order to be saved on container rm
mv /var/www/mautic/app/config/local.php /var/www/mautic/volumes/config/local.php
mv /var/www/mautic/app/config/_local.php /var/www/mautic/app/config/local.php

# Enjoy
```
