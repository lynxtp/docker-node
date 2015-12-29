FROM lynxtp/ubuntu:15.10
MAINTAINER "Tom Vaughan <tvaughan@lynxtp.com>"

RUN curl -sL -o /tmp/node.tar.gz https://nodejs.org/dist/v5.3.0/node-v5.3.0-linux-x64.tar.gz \
    && mkdir -p /opt/node \
    && tar --strip-components=1 -C /opt/node -xf /tmp/node.tar.gz \
    && rm -f /tmp/node.tar.gz

ENTRYPOINT ["/opt/node/bin/node"]