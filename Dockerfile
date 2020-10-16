FROM centos:centos7

RUN curl "http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.7.4.0/ambari.repo" -o /etc/yum.repos.d/ambari.repo

RUN yum install -y "java-1.8.0-openjdk" "maven" "gcc-c++" "rpm-build" "openssh-server" "openssh-clients" "ambari-agent" && yum clean all

