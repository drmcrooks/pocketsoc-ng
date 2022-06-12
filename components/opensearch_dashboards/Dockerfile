FROM opensearchproject/opensearch-dashboards:latest

COPY ./config/opensearch_dashboards.yml /usr/share/opensearch-dashboards/config

ADD ./bin/startup.sh /usr/share/opensearch-dashboards/bin/

RUN chmod +x /usr/share/opensearch-dashboards/bin/startup.sh

CMD ["/usr/share/opensearch-dashboards/bin/startup.sh"]
