build:
	docker build . -t ledsys/mender-io-script-action:0.0.1
	docker build . -t ledsys/mender-io-script-action:latest
push:
	docker push ledsys/mender-io-script-action:0.0.1
	docker push ledsys/mender-io-script-action:latest