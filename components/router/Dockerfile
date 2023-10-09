FROM quay.io/centos/centos:7

#RUN yum install -y net-tools tcpdump iptables lsof bind-utils dnsmasq vim git nmap iputils iproute

ADD ./bin /opt/pocketsoc-ng/bin

RUN chmod +x /opt/pocketsoc-ng/bin/startup.sh

CMD ["/opt/pocketsoc-ng/bin/startup.sh"]