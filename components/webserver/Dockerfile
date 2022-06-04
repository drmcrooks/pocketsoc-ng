FROM httpd:latest

RUN apt-get update && apt-get install -y iproute2 dnsutils iptables

COPY ./data/ /usr/local/apache2/htdocs/

ADD ./bin /opt/pocketsoc-ng/bin

CMD ["/opt/pocketsoc-ng/bin/startup.sh"]
