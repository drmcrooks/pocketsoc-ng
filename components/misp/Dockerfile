FROM ghcr.io/nukib/misp:latest

COPY ./bin/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN chown apache /usr/local/bin/docker-entrypoint.sh && chmod +x /usr/local/bin/docker-entrypoint.sh
