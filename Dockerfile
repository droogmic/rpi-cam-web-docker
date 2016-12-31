# FROM resin/rpi-raspbian:jessie-20160831
# FROM armhfbuild/debian:jessie
FROM resin/rpi-raspbian:jessie

MAINTAINER "Michael Droogleever" <droogmic@yahoo.com>

RUN apt-get update -y && \
    apt-get install -y git psmisc

# from install.sh:322
RUN apt-get install -y dialog nginx php5-fpm php5-cli php5-common php-apc apache2-utils gpac motion zip libav-tools gstreamer1.0-tools

RUN git clone https://github.com/silvanmelchior/RPi_Cam_Web_Interface.git && \
    cd RPi_Cam_Web_Interface; git checkout 667dc11c0f; cd .. && \ 
    chmod u+x RPi_Cam_Web_Interface/*.sh

# workarounds
RUN sed -i '/sudoers/c\' RPi_Cam_Web_Interface/install.sh && \
    sed -i 's/sudo //g' RPi_Cam_Web_Interface/install.sh && \
    sed -i 's/sudo //g' RPi_Cam_Web_Interface/start.sh && \
    sed -i 's/sudo //g' RPi_Cam_Web_Interface/stop.sh && \
    sed -i 's/sudo //g' RPi_Cam_Web_Interface/remove.sh && \
    sed -i 's/sudo //g' RPi_Cam_Web_Interface/update.sh && \
    sed -i 's/sudo //g' RPi_Cam_Web_Interface/RPi_Cam_Web_Interface_Installer.sh && \
    sed -i 's/sudo shutdown -r now//g' RPi_Cam_Web_Interface/www/macros/error_hard.sh && \
    sed -i 's/status_file \/dev/status_file \/run/g' RPi_Cam_Web_Interface/etc/raspimjpeg/raspimjpeg.1

RUN mkdir -p /run/shm/mjpeg

COPY docker-entry.sh /RPi_Cam_Web_Interface
RUN chmod u+x /RPi_Cam_Web_Interface/docker-entry.sh

COPY config.txt /RPi_Cam_Web_Interface

COPY userconfig/uconfig /RPi_Cam_Web_Interface
COPY userconfig/schedule.json /RPi_Cam_Web_Interface

# ENTRYPOINT ./install.sh
# ENTRYPOINT /bin/bash
ENTRYPOINT /RPi_Cam_Web_Interface/docker-entry.sh
