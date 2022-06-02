ARG BASE_IMAGE=quay.io/centos/centos:stream8
FROM $BASE_IMAGE as builder

ENV ZEEK_VER 4.0.6
ENV AFVER 3.0.2

ENV DIR /code
RUN mkdir ${DIR}
WORKDIR ${DIR}

RUN dnf -y install dnf-plugins-core && \
dnf update -y && dnf install -y epel-release && \
dnf --enablerepo=powertools install -y cmake3 make \
gcc gcc-c++ python3 python3-devel \
python3-pip kernel-devel kernel-headers git bash \
libmaxminddb-devel libpcap-devel openssl-devel swig \
flex bison tcpdump wget python3-GitPython

ADD ./Zeek/build build
ADD ./Zeek/build/build_zeek ${DIR}/build/build_zeek
ADD ./Zeek/build/build_af_packet ${DIR}/build/build_af_packet
RUN chmod u+x ${DIR}/build/build_zeek ${DIR}/build/build_af_packet
RUN ${DIR}/build/build_zeek zeek ${ZEEK_VER}
RUN ls
RUN ${DIR}/build/build_af_packet ${ZEEK_VER} ${AFVER} ${DIR}

# Create the image
FROM $BASE_IMAGE

ENV ZEEK_VER 4.0.6
ENV DIR /code
RUN mkdir ${DIR}
WORKDIR ${DIR}

ADD ./Zeek/test test
ADD ./Zeek/config config
ADD ./Zeek/scripts scripts

RUN dnf install -y bash git libmaxminddb libpcap \
openssl python3-devel python3-pip tcpdump && \
dnf update -y && dnf clean all && rm -rf /var/cache/yum

COPY --from=builder /usr/local/zeek-${ZEEK_VER} /usr/local/zeek-${ZEEK_VER}
RUN ln -s /usr/local/zeek-${ZEEK_VER}/logs /var/log/zeek
env PATH /usr/local/zeek-${ZEEK_VER}/bin/:$PATH

CMD ${DIR}/scripts/configure.sh
# Todo: script to run instead of tail -f
CMD zeekctl deploy && tail -f /dev/null
