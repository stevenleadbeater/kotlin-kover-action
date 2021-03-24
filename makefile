build:
	docker build . -t ledsys/mender-io-deb-action:0.0.1
	docker build . -t ledsys/mender-io-deb-action:latest
push:
	docker push ledsys/mender-io-deb-action:0.0.1
	docker push ledsys/mender-io-deb-action:latest