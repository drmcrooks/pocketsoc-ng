FROM ghcr.io/nukib/misp:latest

ADD ./bin /opt/pocketsoc-ng/bin

RUN chmod +x /opt/pocketsoc-ng/bin/changepw.sh

COPY ./config/supervisor.ini /etc/supervisord.d/misp.ini
RUN chmod 644 /etc/supervisord.d/misp.ini
