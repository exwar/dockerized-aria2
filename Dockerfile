FROM alpine:3
MAINTAINER Stanislav Nekrasov <to@exwar.com>
ENV PKG "aria2 bash curl tzdata"

RUN apk add --no-cache $PKG && \
    cp /usr/share/zoneinfo/Australia/Melbourne /etc/locatime && \
    echo "Australia/Melbourne" > /etc/timezone && \
    adduser -D -g '' aria2


EXPOSE 6800
USER aria2
ENV HOME /home/aria2

CMD ["/usr/bin/aria2c", "--conf-path=/home/aria2/.aria2/aria2.conf"]
