FROM devmoonduck/ambari-local-base:2.7.4.0

RUN yum install -y ambari-agent && yum clean all && rm -rf /var/cache/yum 

COPY run-ambari-agent.sh /entry/usr/
COPY ambari-conf/ambari-agent.ini /etc/ambari-agent/conf/

