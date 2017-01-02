#!/bin/bash
service nginx restart
RPi_Cam_Web_Interface/start.sh

#  e.g. php5-fpm -F
if [ $# -eq 0 ]
then
    echo "Running php-fpm in foreground"
    php5-fpm -F
elif [ $1 == "debug" ]
then
    echo "debug"
    php5-fpm -D
    /bin/bash
else
    echo "Invalid parameter $1"
fi
