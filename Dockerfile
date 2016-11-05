FROM alpine:3.4

RUN apk add --no-cache squid && \
    echo "pid_filename /tmp/suid.pid"

USER squid

EXPOSE 3128

# VOLUME ["/etc/squid/squid.conf"]

ENTRYPOINT ["/usr/sbin/squid"]

CMD ["-d1", "-N", "-C"]
