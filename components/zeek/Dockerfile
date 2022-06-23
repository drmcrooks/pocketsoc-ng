FROM quay.io/centos/centos:stream8

COPY ./repo/zeek.repo /etc/yum.repos.d/

RUN yum install ethtool epel-release -y && yum install -y dnf-plugins-core && yum config-manager --set-enabled powertools

#RUN yum install -y cmake make gcc gcc-c++ flex bison libpcap-devel openssl-devel python3 python3-devel swig zlib-devel git

RUN yum install -y zeek tcpdump supervisor && yum update -y && \ 
    yum clean all && rm -rf /var/cache/yum

#RUN git clone --recursive https://github.com/zeek/zeek && cd ./zeek && ./configure --prefix="/opt/zeek" && make && make install

RUN rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch 
COPY ./repo/elastic-oss.repo /etc/yum.repos.d/

RUN yum install -y filebeat

env PATH /opt/zeek/bin/:$PATH

ADD ./config/zeekctl.cfg /opt/zeek/etc/zeekctl.cfg
ADD ./config/networks.cfg /opt/zeek/etc/networks.cfg
ADD ./config/node.cfg /opt/zeek/etc/node.cfg

COPY ./config/local.zeek /opt/zeek/share/zeek/site/local.zeek
COPY ./config/mattermost.zeek /opt/zeek/share/zeek/site/mattermost.zeek

COPY ./config/filebeat.yml /etc/filebeat/filebeat.yml

ADD ./bin /opt/pocketsoc-ng/bin
RUN chmod +x /opt/pocketsoc-ng/bin/startup.sh

ADD ./config/supervisor.conf /etc/supervisord.conf
CMD ["/opt/pocketsoc-ng/bin/startup.sh"]
