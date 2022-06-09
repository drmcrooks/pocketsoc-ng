FROM opensearchproject/opensearch:latest

#RUN rpm install https://amazonlinux.pkgs.org/2/amazonlinux-core-x86_64/gettext-0.19.8.1-3.amzn2.x86_64.rpm.html
#yum install -y gettext

ADD ./bin /opt/pocketsoc-ng/bin

RUN chmod +x /opt/pocketsoc-ng/bin/adminpassword.sh && /opt/pocketsoc-ng/bin/adminpassword.sh
