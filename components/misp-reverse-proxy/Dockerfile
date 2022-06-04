FROM httpd:latest

ADD ./bin /opt/pocketsoc-ng/bin

RUN mkdir -p /usr/local/apache2/conf/cert
RUN chmod +x /opt/pocketsoc-ng/bin/generate_keys.sh && /opt/pocketsoc-ng/bin/generate_keys.sh

RUN chmod +x /opt/pocketsoc-ng/bin/startup.sh

CMD ["/opt/pocketsoc-ng/bin/startup.sh"]
