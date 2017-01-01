if [ $# -eq 0 ]
  then
    docker run -d --name=rpi-cam  -p=80:80/tcp --volume=/opt/vc:/opt/vc --device=/dev/vchiq --device=/dev/vcsm droogmic/rpi-cam-web
  else
    docker run -d --name=rpi-cam  -p=80:80/tcp --volume=/opt/vc:/opt/vc --device=/dev/vchiq --device=/dev/vcsm droogmic/rpi-cam-web:$1
fi
