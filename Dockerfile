FROM devmoonduck/ambari-local-base:2.7.4.0

LABEL maintainer="devlog.moonduck@gmail.com"

RUN yum install -y initscripts ambari-agent && yum clean all && rm -rf /var/cache/yum 

COPY run-ambari-agent.sh /entry/usr/

COPY ambari-conf/ambari-agent.ini /etc/ambari-agent/conf/

RUN ssh-keygen -t rsa -q -f "/root/.ssh/id_rsa" -N "" && curl https://raw.githubusercontent.com/dev-m00n/ambari-local-server/master/id_rsa.pub -o /root/.ssh/authorized_keys

#Since installing rpcbind overwrites systemctl in /usr/bin/, we need to move custom systemctl to safe place, and get it back to /usr/bin/
RUN mv /usr/bin/systemctl /tmp/ && yum install -y rpcbind && yum clean all && rm -rf /var/cache/yum && mv /tmp/systemctl /usr/bin/
