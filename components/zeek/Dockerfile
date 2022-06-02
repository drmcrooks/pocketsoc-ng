FROM quay.io/centos/centos:stream8

ENV ZEEK_VER latest

ENV DIR /opt/pocketsoc-ng/code
RUN mkdir -p ${DIR}
WORKDIR ${DIR}

ADD ./build build
ADD ./config config
ADD ./scripts scripts
ADD ./test test

COPY ./repo/zeek.repo /etc/yum.repos.d/

RUN yum install -y bash git libmaxminddb libpcap openssl\
 python3 python3-devel python3-pip tcpdump && yum update\
 -y && yum clean all && rm -rf /var/cache/yum

RUN yum install -y zeek

env PATH /opt/zeek/bin/:$PATH
RUN /bin/sh scripts/configure.sh ${DIR} ${ZEEK_VER}
# Todo: script to run instead of tail -f
CMD zeekctl deploy && tail -f /dev/null

