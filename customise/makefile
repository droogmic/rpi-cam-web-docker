default:
	@echo pass
dev-build:
	docker build -t rpi-cam-web:develop .
latest-build:
	docker build -t rpi-cam-web:release  -f Dockerfile.latest .
Dockerfile.latest: Dockerfile
	@echo "overwriting Dockerfile.latest"
	cp Dockerfile.latest Dockerfile.latest.bkp
	sed 's/:develop/:latest/' Dockerfile > Dockerfile.latest
release: Dockerfile.latest
