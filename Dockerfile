FROM gradle:jdk8 as builder
USER root
WORKDIR /builder
COPY . /builder
RUN gradle wrapper
RUN /builder/gradlew clean build --stacktrace --debug --info

FROM openjdk:8-jre-slim
EXPOSE 8080
COPY --from=builder /builder/build/libs/app-*.jar /app/app.jar
WORKDIR /app
ENTRYPOINT [ "java", "-jar", "app.jar" ]