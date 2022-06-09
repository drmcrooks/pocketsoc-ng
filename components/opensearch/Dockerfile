FROM opensearchproject/opensearch:latest

ADD ./bin /opt/pocketsoc-ng/bin

RUN chmod +x /opt/pocketsoc-ng/bin/changepw.sh

RUN chmod 644 /etc/supervisord.d/misp.ini
