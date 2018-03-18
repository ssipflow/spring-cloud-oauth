FROM openjdk:8-jdk-alpine
LABEL maintainer="Leonardo Park"
VOLUME /tmp
ADD ./build/libs/app.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]