if [ $# -eq 0 ]
  then
    docker build -t droogmic/rpi-cam-web .
  else
    docker build -t droogmic/rpi-cam-web:$1 .
fi
