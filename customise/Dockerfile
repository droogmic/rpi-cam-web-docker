FROM droogmic/rpi-cam-web:develop

MAINTAINER "Michael Droogleever" <droogmic@yahoo.com>

# user configs, used to copy over exisiting configurations, TODO: add motion
COPY userconfig/uconfig ./RPi_Cam_Web_Interface/
COPY userconfig/schedule.json ./RPi_Cam_Web_Interface/

ENTRYPOINT rpi-cam-web
CMD ["-F"]
