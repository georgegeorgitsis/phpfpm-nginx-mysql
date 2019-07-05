#!/bin/bash

wait_mysql() {
    while :
    do
        mysql -h$1 -u$2 -p$3 --silent --force -b 2> /dev/null

        if [[ $? -eq 0 ]]; then
            echo "MySQL is finally up!"
            break
        else
            echo "MySQL is down!"
        fi

        echo "Try again in 5s"
        sleep 5
    done
}


set -a
. /usr/share/envfile
set +a

echo "Generating CRYPTO and MAC keys..."
CRYPTO_KEY=`xxd -len 32 -ps -cols 256 /dev/urandom`
MAC_KEY=`xxd -len 64 -ps -cols 256 /dev/urandom`

echo "Putting into .env..."
sed "s/CRYPTO_KEY=\.../CRYPTO_KEY=$CRYPTO_KEY/" /usr/share/envfile > /tmp/.intermediate-file && cp /tmp/.intermediate-file /usr/share/envfile
sed "s/MAC_KEY=\.../MAC_KEY=$MAC_KEY/" /usr/share/envfile > /tmp/.intermediate-file && cp /tmp/.intermediate-file /usr/share/envfile

wait_mysql $MYSQL_IP root $MYSQL_ROOT_PASSWORD

echo "Finished initialising"

command php-fpm