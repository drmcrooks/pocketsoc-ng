FROM ghcr.io/nukib/misp:latest

COPY ./bin/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod u=rwx,g=rx,o=rx /usr/local/bin/docker-entrypoint.sh

COPy ./config/supervisor.ini /etc/supervisord.d/misp.ini
RUN chmod 644 /etc/supervisord.d/misp.ini
