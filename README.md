# RPi-Cam-Web-Interface Docker

This repo provides a Dockerfile which will containerise the RPi-Cam-Web-Interface, as found [here on GitHub](https://github.com/silvanmelchior/RPi_Cam_Web_Interface) or [as described here on their wiki](http://elinux.org/RPi-Cam-Web-Interface).

## Notes
+ The license is MIT.
+ It may not function as advertised.
+ Submit pull requests to improve this project.
+ Currently only works with nginx server.
+ Contains workarounds for problems found running the normal install script in a container

## File description
+ makefile - main makefile for controlling builds and containers
  + make ld-userconfig - load a user config located in userconfigs
  + make dev-build - docker build all images
  + make dev-run - docker run image in detached mode
  + make dev-debug - docker run image in foreground

## Installation

### Docker Hub
https://hub.docker.com/r/droogmic/rpi-cam-web/

### Git clone
```
git clone https://github.com/droogmic/rpi-cam-web-docker.git
cd rpi-cam-web-docker
make ld-userconfig
default
make dev-build
make dev-run
```

## Develpment

Development is done using the makefile.
+ Modify files as needed
+ `make ld-userconfig` (optional) - loads config based on name, default: default
+ `make dev-build` - Builds new images, if there are errors, correct and run again
+ `make dev-debug` - Test to see if it works
+ `make release` - Re-tag images in preparation of being pushed
+ `make push` - Docker push
