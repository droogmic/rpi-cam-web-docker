rpi-cam-web-docker
# RPi-Cam-Web-Interface Docker

This repo provides a Dockerfile which will containerise the RPi-Cam-Web-Interface, as found [here on GitHub](https://github.com/silvanmelchior/RPi_Cam_Web_Interface) or [as described here on their wiki](http://elinux.org/RPi-Cam-Web-Interface).

## Notes

+ The license is MIT. 
+ It may not function as advertised. 
+ Submit pull requests to improve this project.
+ Currently only works with nginx server.
+ Contains MOSTLY workarounds for problems found during the normal install problems
+ Liable to break as the source github repo changes.

## File description

+ Dockerfile - Main dockerfile for building the image
+ config.txt - Install configuration for quiet install
+ docker-build.sh - `# . docker-build.sh` Command to build the image
+ docker-run.sh - `# . docker-run.sh` Command to run the image as a detached container
+ docker-debug.sh - `# . docker-debug.sh` Command to run the command in the foreground for debugging
+ docker-entry.sh - Entrypoint script for the Dockerfile which is copied to the container
+ userconfig/ - Contains all the user configurable files, provided are examples from my system

## Installation

### Docker Hub
https://hub.docker.com/r/droogmic/rpi-cam-web/

### Git clone
```
git clone https://github.com/droogmic/rpi-cam-web-docker.git
cd rpi-cam-web-docker
. docker-build.sh
. docker-run.sh
```
