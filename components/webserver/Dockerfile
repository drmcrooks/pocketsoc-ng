FROM httpd:latest

RUN apt-get update && apt-get install -y iproute2

COPY ./data/ /usr/local/apache2/htdocs/

COPY ./bin/startup.sh /opt/pocketsoc-ng/webserver/bin/startup.sh

RUN chmod +x /opt/pocketsoc-ng/webserver/bin/startup.sh

CMD ['/opt/pocketsoc-ng/webserver/bin/startup.sh']