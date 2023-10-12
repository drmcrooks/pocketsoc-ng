FROM quay.io/centos/centos:7

#RUN dnf install -y net-tools tcpdump iptables lsof   vim  git libpcap-devel pkgconfig libtool autoconf automake bash make psmisc && \
RUN yum install -y bind-utils iputils iproute net-tools traceroute net-tools tcpdump iptables lsof vim openssh-clients
RUN yum update -y

ADD ./bin /opt/pocketsoc-ng/bin

RUN chmod +x /opt/pocketsoc-ng/bin/startup.sh

CMD ["/opt/pocketsoc-ng/bin/startup.sh"]    
