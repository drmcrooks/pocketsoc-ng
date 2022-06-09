FROM opensearchproject/opensearch:latest

RUN sudo yum search gettext > /root/out.text
#yum install -y gettext

ADD ./bin /opt/pocketsoc-ng/bin

RUN chmod +x /opt/pocketsoc-ng/bin/adminpassword.sh && /opt/pocketsoc-ng/bin/adminpassword.sh
