docker run -d --name=rpi-cam  -p=80:80/tcp --volume=/opt/vc:/opt/vc --device=/dev/vchiq --device=/dev/vcsm droogmic/rpi-cam-web

