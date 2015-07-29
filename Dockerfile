FROM       golang:1.4
MAINTAINER Michael Nikitochkin <nikitochkin.michael@gmail.com>

RUN        wget https://raw.githubusercontent.com/pote/gpm/v1.3.2/bin/gpm && chmod +x gpm && mv gpm /usr/local/bin

ADD        . /go/src/github.com/stealthly/go_kafka_client
WORKDIR    /go/src/github.com/stealthly/go_kafka_client

RUN        gpm install
RUN        go install -v ./mirrormaker

VOLUME     /mirrormaker
ENTRYPOINT ["/go/bin/mirrormaker"]
CMD        ["--help"]
