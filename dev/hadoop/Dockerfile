FROM ubuntu:16.04


RUN apt-get update && apt-get install -y openjdk-8-jdk curl ssh iproute2 net-tools dnsutils vim supervisor

RUN mkdir -p /data/hdfs/
RUN mkdir -p /opt
WORKDIR /opt

# Install Hadoop
RUN curl -L http://ftp.cuhk.edu.hk/pub/packages/apache.org/hadoop/common/hadoop-2.9.1/hadoop-2.9.1.tar.gz -s -o - | tar -xzf - && mv hadoop-2.* hadoop

RUN curl -L http://ftp.cuhk.edu.hk/pub/packages/apache.org/hive/hive-2.3.3/apache-hive-2.3.3-bin.tar.gz -s -o - | tar -xzf - && mv apache-hive* hive
# RUN mv hadoop-2.* hadoop
ENV HADOOP_HOME /opt/hadoop
ENV HIVE_HOME=/opt/hive
ENV HIVE_CONF_DIR=/opt/hive/conf



# Setup
WORKDIR /opt/hadoop
ENV PATH /opt/hadoop/bin:/opt/hadoop/sbin:/opt/hive/bin:$PATH
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
RUN sed --in-place='.ori' -e "s/\${JAVA_HOME}/\/usr\/lib\/jvm\/java-8-openjdk-amd64/" etc/hadoop/hadoop-env.sh

COPY conf/hive/mysql-connector-java-8.0.11.jar /opt/hive/lib/
COPY conf/hive/hive-env.sh /opt/hive/conf/hive-env.sh
COPY conf/hive/hive-site.xml /opt/hive/conf/hive-node-hive-site.xml
COPY conf/hive/hive-log4j.properties /opt/hive/conf/
COPY conf/hive/hive-exec-log4j2.properties /opt/hive/conf/
COPY conf/hive/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Pseudo-Distributed Operation
COPY conf/datanode/core-site.xml etc/hadoop/data-node-core-site.xml
COPY conf/datanode/hdfs-site.xml etc/hadoop/data-node-hdfs-site.xml
COPY conf/datanode/yarn-site.xml etc/hadoop/data-node-yarn-site.xml
COPY conf/datanode/mapred-site.xml etc/hadoop/data-node-mapred-site.xml
COPY conf/namenode/core-site.xml etc/hadoop/name-node-core-site.xml
COPY conf/namenode/hdfs-site.xml etc/hadoop/name-node-hdfs-site.xml
COPY conf/namenode/yarn-site.xml etc/hadoop/name-node-yarn-site.xml
COPY conf/namenode/mapred-site.xml etc/hadoop/name-node-mapred-site.xml

RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

EXPOSE 9000 8088 50070 9999

# SSH login fix. Otherwise user is kicked off after login
# RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
# ENV NOTVISIBLE "in users profile"
# RUN echo "export VISIBLE=now" >> /etc/profile

VOLUME /data/

COPY entrypoint.sh /
COPY run-wordcount.sh /
COPY conf/ssh_config /root/.ssh/config
RUN chmod a+x /*.sh
ENTRYPOINT "/entrypoint.sh"
