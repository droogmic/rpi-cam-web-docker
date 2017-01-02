FROM droogmic/rpi-cam-web:develop-preinstall

MAINTAINER "Michael Droogleever" <droogmic@yahoo.com>

# psmisc for killall
# rest from install.sh:322
# RUN apt-get update -y && \
#     apt-get install -y psmisc dialog nginx php5-fpm php5-cli php5-common php-apc apache2-utils gpac motion zip libav-tools gstreamer1.0-tools

# application config, doesnt need modifying
COPY config.txt ./RPi_Cam_Web_Interface/

# run install in quiet mode
RUN RPi_Cam_Web_Interface/install.sh q

# entry file
COPY docker-entry.sh ./
RUN chmod u+x docker-entry.sh && \
    ln docker-entry.sh /usr/local/bin/rpi-cam-web

ENTRYPOINT ["rpi-cam-web"]
