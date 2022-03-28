build:
	docker build . -t ledsys/kover-report-parser-action:0.0.1
	docker build . -t ledsys/kover-report-parser-action:latest
push:
	docker push ledsys/kover-report-parser-action:0.0.1
	docker push ledsys/kover-report-parser-action:latest