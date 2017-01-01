all:
	@echo "options: dup-make, makefile-dev, build(-dev)"
dup-make:
	@echo "overwriting Dockerfile.dev"
	cp Dockerfile.dev Dockerfile.bkp.dev 2>/dev/null || :
	cp Dockerfile Dockerfile.dev
makefile-dev: Dockerfile
	@echo "Manually create and update Dockerfile.dev with higher version number."
	# sed 's/.*git checkout.*/\# &/g' Dockerfile > Dockerfile.dev
build-dev: makefile-dev
	docker build -t droogmic/rpi-cam-web:develop-setup -f Dockerfile.dev .
	docker run -it --name=rpi-cam-web-setup -p=80:80/tcp --volume=/opt/vc:/opt/vc --device=/dev/vchiq --device=/dev/vcsm droogmic/rpi-cam-web:develop-setup
	docker commit rpi-cam-web-setup droogmic/rpi-cam-web:develop-preinstall
	+$(MAKE) .rm-run
	docker rmi droogmic/rpi-cam-web:develop-setup
build:
	docker build -t droogmic/rpi-cam-web:release-setup .
	docker run -it --name=rpi-cam-web-setup -p=80:80/tcp --volume=/opt/vc:/opt/vc --device=/dev/vchiq --device=/dev/vcsm droogmic/rpi-cam-web:release-setup
	docker commit rpi-cam-web-setup droogmic/rpi-cam-web:release-preinstall
	+$(MAKE) .rm-run
	docker rmi droogmic/rpi-cam-web:release-setup
release:
	cp Dockerfile.dev Dockerfile
.rm-run:
	docker rm rpi-cam-web-setup
