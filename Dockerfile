FROM devmoonduck/ambari-local-base:2.7.4.0

LABEL maintainer="devlog.moonduck@gmail.com"

RUN yum install -y ambari-agent && yum clean all && rm -rf /var/cache/yum 

COPY run-ambari-agent.sh /entry/usr/

COPY ambari-conf/ambari-agent.ini /etc/ambari-agent/conf/

RUN ssh-keygen -t rsa -q -f "/root/.ssh/id_rsa" -N "" && curl https://raw.githubusercontent.com/dev-m00n/ambari-local-server/master/id_rsa.pub -o /root/.ssh/authorized_keys
