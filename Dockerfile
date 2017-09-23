FROM alpine:edge

# install bash
RUN \
  apk add --no-cache bash

# install java
RUN \
  apk add --no-cache openjdk8

# install jq
RUN \
  apk add --no-cache jq

# install zip
RUN \
  apk add --no-cache zip

RUN \
  mkdir /tmp/hightload


WORKDIR /tmp/hightload
RUN \
  mkdir /tmp/data
ADD ./target/webserver.jar ./webserver.jar
#COPY ./data.zip /tmp/data
RUN \
  mkdir /tmp/unzipped && \
  export DATA_HOME=/tmp/unzipped
EXPOSE 80

CMD unzip /tmp/data/data.zip -d /tmp/unzipped && java -server -Xms3488m -Xmx3488m -jar ./webserver.jar

