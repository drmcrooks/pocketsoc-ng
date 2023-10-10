FROM httpd:latest

RUN apt-get update
ADD ./bin /opt/pocketsoc-ng/bin

COPY ./config/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY ./config/reverse-proxy-ssl.conf /usr/local/apache2/conf/reverse-proxy-ssl.conf

RUN chmod +x /opt/pocketsoc-ng/bin/startup.sh

CMD ["/opt/pocketsoc-ng/bin/startup.sh"]
