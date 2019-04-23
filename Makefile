build:
	docker build -t sample-sb-gradle-app .

run: build
	docker run sample-sb-gradle-app
