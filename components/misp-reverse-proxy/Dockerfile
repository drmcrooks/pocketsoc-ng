FROM httpd:latest

RUN apt-get update && apt-get install openssl
ADD ./bin /opt/pocketsoc-ng/bin

RUN mkdir -p /usr/local/apache2/conf/cert && chmod +x /opt/pocketsoc-ng/bin/generate_keys.sh && /opt/pocketsoc-ng/bin/generate_keys.sh

COPY ./config/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY ./config/reverse-proxy-ssl.conf /usr/local/apache2/conf/reverse-proxy-ssl.conf

RUN chmod +x /opt/pocketsoc-ng/bin/startup.sh

CMD ["/opt/pocketsoc-ng/bin/startup.sh"]
