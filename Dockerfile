FROM openjdk:8
LABEL maintainer "Martin Schmidt <docker@private-data.de>"
LABEL version="1.0.1"

RUN mkdir /app
WORKDIR /app/

RUN curl -O https://www.shinyproxy.io/downloads/shinyproxy-1.0.1.jar
RUN echo "7a27ef28310e8633aef663fe17dd1015b754d02f7bfdfb11999ae69a10684b98 shinyproxy-1.0.1.jar" | sha256sum -c

COPY application.yml /app/

EXPOSE 8080
CMD ["java", "-jar", "/app/shinyproxy-1.0.1.jar" ]
