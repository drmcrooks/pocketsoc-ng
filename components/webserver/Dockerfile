FROM httpd:latest

RUN apt-get update && apt-get install -y iproute2

COPY ./data/ /usr/local/apache2/htdocs/

ADD ./bin /opt/pocketsoc-ng/webserver/bin

RUN chmod +x /opt/pocketsoc-ng/webserver/bin/startup.sh

CMD ["/opt/pocketsoc-ng/webserver/bin/startup.sh"]