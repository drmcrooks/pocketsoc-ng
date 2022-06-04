FROM httpd:latest

RUN apt-get update && apt-get install openssl
ADD ./bin /opt/pocketsoc-ng/bin

RUN mkdir -p /usr/local/apache2/conf/cert && chmod +x /opt/pocketsoc-ng/bin/generate_keys.sh && /opt/pocketsoc-ng/bin/generate_keys.sh

RUN chmod +x /opt/pocketsoc-ng/bin/startup.sh

CMD ["/opt/pocketsoc-ng/bin/startup.sh"]
