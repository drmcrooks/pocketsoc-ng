FROM quay.io/centos/centos:stream8

COPY ./repo/zeek.repo /etc/yum.repos.d/

RUN yum install ethtool epel-release -y && yum install -y dnf-plugins-core && yum config-manager --set-enabled powertools

RUN yum install -y zeek tcpdump && yum update -y && \ 
    yum clean all && rm -rf /var/cache/yum

env PATH /opt/zeek/bin/:$PATH

ADD ./config/zeekctl.cfg /opt/zeek/etc/zeekctl.cfg
ADD ./config/networks.cfg /opt/zeek/etc/networks.cfg
ADD ./config/node.cfg /opt/zeek/etc/node.cfg

ADD ./config/local.zeek /opt/zeek/share/zeek/site/local.zeek

ADD ./bin /opt/pocketsoc-ng/bin
RUN chmod +x /opt/pocketsoc-ng/bin/startup.sh

CMD ["/opt/pocketsoc-ng/bin/startup.sh"]