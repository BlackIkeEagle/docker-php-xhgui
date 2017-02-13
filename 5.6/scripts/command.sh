#!/bin/sh

/prepare.sh

gosu www-data rsync -a --info=progress2 /var/lib/xhgui/ /phpapp/

if [ "php-fpm5.6" != "$1" ] && [ "/bin/bash" != "$1" ]; then
    exec gosu www-data "$@"
else
    exec "$@"
fi