ts := $(shell /bin/date "+%Y%m%d")

all:
	@echo "options: makefile-dev, build(-dev), run, push, release"
makefile-dev build-dev build:
	+$(MAKE) -C setup $@
	+$(MAKE) -C install $@
	+$(MAKE) -C customise $@
debug-dev:
	docker run -it --rm -p=80:80/tcp --volume=/opt/vc:/opt/vc --device=/dev/vchiq --device=/dev/vcsm rpi-cam-web:develop
run-dev:
	docker run -d --name=rpi-cam  -p=80:80/tcp --volume=/opt/vc:/opt/vc --device=/dev/vchiq --device=/dev/vcsm rpi-cam-web:develop
push:
	docker push droogmic/rpi-cam-web
release:
	docker tag droogmic/rpi-cam-web:develop-preinstall droogmic/rpi-cam-web:release-preinstall
	docker tag droogmic/rpi-cam-web:develop droogmic/rpi-cam-web:release
	docker tag droogmic/rpi-cam-web:develop-preinstall droogmic/rpi-cam-web:$(ts)-preinstall
	docker tag droogmic/rpi-cam-web:develop droogmic/rpi-cam-web:$(ts)
	+$(MAKE) -C setup $@
	+$(MAKE) -C install $@
	+$(MAKE) -C customise $@
