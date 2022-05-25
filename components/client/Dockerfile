FROM quay.io/centos/centos:stream8

#RUN dnf install -y net-tools tcpdump iptables lsof   vim  git libpcap-devel pkgconfig libtool autoconf automake bash make psmisc && \
RUN dnf install -y bind-utils iputils iproute
RUN dnf update -y

# RUN git clone https://github.com/pmacct/pmacct && cd pmacct && ./autogen.sh && ./configure && make && make install

ADD ./bin /opt/pocketsoc-ng/client/bin

RUN chmod +x /opt/pocketsoc-ng/client/bin/startup.sh

CMD ["/opt/pocketsoc-ng/client/bin/startup.sh"]
