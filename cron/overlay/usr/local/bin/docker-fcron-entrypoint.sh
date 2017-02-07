#!/usr/bin/env bash

set -e

for FILE in `find /etc/cron.d/ -type f`;  do
    fcrontab $FILE
done

/usr/local/bin/docker-entrypoint.sh "$@"
