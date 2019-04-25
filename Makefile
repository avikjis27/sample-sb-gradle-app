docker-build:
	docker build -t sample-sb-gradle-app .

docker-run: docker-build
	docker run -p 8080:8080 sample-sb-gradle-app
