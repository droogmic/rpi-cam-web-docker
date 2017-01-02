#!/bin/bash
service nginx restart
RPi_Cam_Web_Interface/start.sh

#  e.g. php5-fpm -F
if [ $# -eq 0 ]
  then
      echo "No param"
      php5-fpm -B
  else
      echo "Param $1"
      php5-fpm $1
fi
