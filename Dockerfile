FROM alpine:3.4

RUN apk add --no-cache squid && \
    echo "pid_filename /tmp/suid.pid" >> /etc/squid/squid.conf && \
    echo "cache_log /tmp/cache.log" >> /etc/squid/squid.conf && \
    echo "access_log /tmp/access.log" >> /etc/squid/squid.conf

USER squid

EXPOSE 3128

# VOLUME ["/etc/squid/squid.conf"]

ENTRYPOINT ["/usr/sbin/squid"]

CMD ["-d1", "-N", "-C"]
