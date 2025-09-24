FROM alpine:3.18

COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN apk add --no-cache stunnel openssl \
    && chmod +x /docker-entrypoint.sh

VOLUME /etc/stunnel

ENTRYPOINT ["/docker-entrypoint.sh"]
