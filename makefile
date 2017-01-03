ts := $(shell /bin/date "+%Y%m%d")

default:
	@echo pass
dev-build latest-build:
	+$(MAKE) -C setup $@
	+$(MAKE) -C install $@
	+$(MAKE) -C customise $@
dev-build-install:
	+$(MAKE) -C install dev-build
	+$(MAKE) -C customise dev-build
dev-build-customise:
	+$(MAKE) -C customise dev-build
dev-debug:
	docker run -it --rm -p=80:80/tcp --volume=/opt/vc:/opt/vc --device=/dev/vchiq --device=/dev/vcsm rpi-cam-web:develop debug
dev-run:
	docker run -d --name=rpi-cam -p=80:80/tcp --volume=/opt/vc:/opt/vc --device=/dev/vchiq --device=/dev/vcsm rpi-cam-web:develop
ld-userconfig:
	read -p "Enter userconfig name: " userconfig_name; \
	cp -r userconfigs/$$userconfig_name customise/; \
	mv customise/$$userconfig_name customise/userconfig
push:
	docker push droogmic/rpi-cam-web
release:
	docker tag droogmic/rpi-cam-web:develop-preinstall droogmic/rpi-cam-web:latest-preinstall
	docker tag droogmic/rpi-cam-web:develop droogmic/rpi-cam-web:latest
	docker tag droogmic/rpi-cam-web:develop-preinstall droogmic/rpi-cam-web:$(ts)-preinstall
	docker tag droogmic/rpi-cam-web:develop droogmic/rpi-cam-web:$(ts)
	+$(MAKE) -C setup $@
	+$(MAKE) -C install $@
	+$(MAKE) -C customise $@
rmi:
	docker rmi $(shell docker images --filter dangling=true -q) || true
rm:
	docker rm -v $(shell docker ps --filter status=exited -q) || true
volumes-rm:
	docker volume rm $(shell docker volume ls -qf dangling=true) || true
