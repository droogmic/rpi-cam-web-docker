#!/bin/bash

echo /opt/vc/lib > /etc/ld.so.conf
ldconfig

/RPi_Cam_Web_Interface/install.sh q
cp /RPi_Cam_Web_Interface/uconfig /var/www/
rm /var/www/macros/error_hard.sh
/RPi_Cam_Web_Interface/start.sh
php5-fpm -F

/bin/bash
