FROM quay.io/centos/centos:stream8

RUN yum install -y net-tools tcpdump iptables lsof bind-utils dnsmasq vim git nmap iputils iproute

ADD ./bin /opt/pocketsoc-ng/router/bin

RUN chmod +x /opt/pocketsoc-ng/router/bin/startup.sh

CMD ["/opt/pocketsoc-ng/router/bin/startup.sh"]