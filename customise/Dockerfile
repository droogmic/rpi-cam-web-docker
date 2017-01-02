FROM droogmic/rpi-cam-web:develop

MAINTAINER "Michael Droogleever" <droogmic@yahoo.com>

# user configs, used to copy over exisiting configurations, TODO: add motion
COPY userconfig/uconfig /var/www/
COPY userconfig/schedule.json /var/www/

ENTRYPOINT ["rpi-cam-web"]
