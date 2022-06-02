FROM quay.io/centos/centos:stream8

ENV ZEEK_VER 4.0.6

ENV DIR /opt/pocketsoc-ng/code
RUN mkdir -p ${DIR}
WORKDIR ${DIR}

ADD ./config config
ADD ./scripts scripts

COPY ./repo/zeek.repo /etc/yum.repos.d/

RUN pip install GitPython

RUN yum install -y zeek-4.0.6 && yum update\
 -y && yum clean all && rm -rf /var/cache/yum

env PATH /opt/zeek/bin/:$PATH
RUN /bin/sh scripts/configure.sh ${DIR} ${ZEEK_VER}
# Todo: script to run instead of tail -f
CMD zeekctl deploy && tail -f /dev/null

