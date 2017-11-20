FROM openjdk:8
LABEL maintainer "Martin Schmidt <docker@private-data.de>"
LABEL version="1.0.2"

RUN mkdir /app
WORKDIR /app/

RUN curl -O https://www.shinyproxy.io/downloads/shinyproxy-1.0.2.jar
RUN echo "6175b6bed4fe25a788dce880212a2bf39072611c6d5077eb479678228734c256 shinyproxy-1.0.2.jar" | sha256sum -c

COPY application.yml /app/

EXPOSE 8080
CMD ["java", "-jar", "/app/shinyproxy-1.0.2.jar" ]
