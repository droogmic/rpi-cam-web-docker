# FROM resin/rpi-raspbian:jessie-20160831
# FROM armhfbuild/debian:jessie
FROM resin/rpi-raspbian:jessie

MAINTAINER "Michael Droogleever" <droogmic@yahoo.com>

RUN apt-get update -y && \
    apt-get install -y git
    # psmisc

# psmisc for killall
# rest from install.sh:322
RUN apt-get update -y && \
    apt-get install -y psmisc dialog nginx php5-fpm php5-cli php5-common php-apc apache2-utils gpac motion zip libav-tools gstreamer1.0-tools

# download installation files
RUN git clone https://github.com/silvanmelchior/RPi_Cam_Web_Interface.git && \
    # comment the following line to download the untested most recent version
    cd RPi_Cam_Web_Interface; git checkout 2bc8542; cd .. && \
    chmod u+x RPi_Cam_Web_Interface/*.sh

# workarounds
RUN mkdir -p /run/shm/mjpeg && \
    sed -i '/sudoers/c\\# sudoers removed' RPi_Cam_Web_Interface/install.sh && \
    sed -i '/\/opt\/vc\/bin\//c\\# raspimjpeg removed' RPi_Cam_Web_Interface/install.sh && \
    sed -i 's/sudo //g' RPi_Cam_Web_Interface/install.sh && \
    sed -i 's/sudo //g' RPi_Cam_Web_Interface/start.sh && \
    sed -i 's/sudo //g' RPi_Cam_Web_Interface/stop.sh && \
    sed -i 's/sudo //g' RPi_Cam_Web_Interface/remove.sh && \
    sed -i 's/sudo //g' RPi_Cam_Web_Interface/update.sh && \
    sed -i 's/sudo //g' RPi_Cam_Web_Interface/RPi_Cam_Web_Interface_Installer.sh && \
    sed -i 's/sudo shutdown -r now//g' RPi_Cam_Web_Interface/www/macros/error_hard.sh && \
    rm RPi_Cam_Web_Interface/www/macros/error_hard.sh

# entry file
COPY docker-setup.sh RPi_Cam_Web_Interface
RUN chmod u+x RPi_Cam_Web_Interface/docker-setup.sh

CMD RPi_Cam_Web_Interface/docker-setup.sh
