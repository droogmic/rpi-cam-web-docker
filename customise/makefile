all:
	@echo "options: makefile-dev, build(-dev)"
makefile-dev: Dockerfile
	sed 's/:latest/:develop/' Dockerfile > Dockerfile.dev
build-dev: makefile-dev
	docker build -t rpi-cam-web:develop  -f Dockerfile.dev .
build:
	docker build -t rpi-cam-web:release .
release:
	@echo pass
