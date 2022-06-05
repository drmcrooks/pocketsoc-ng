FROM ghcr.io/nukib/misp:latest

ADD ./bin /opt/pocketsoc-ng/bin

RUN chmod +x /opt/pocketsoc-ng/bin/startup.sh && /opt/pocketsoc-ng/bin/startup.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["supervisord", "-c", "/etc/supervisord.conf"]
