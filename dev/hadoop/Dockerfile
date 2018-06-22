FROM phusion/baseimage


RUN apt-get update && apt-get install -y openjdk-8-jdk curl

RUN mkdir -p /data/hdfs/
RUN mkdir -p /opt
WORKDIR /opt

# Install Hadoop
RUN curl -L http://ftp.cuhk.edu.hk/pub/packages/apache.org/hadoop/common/hadoop-2.8.4/hadoop-2.8.4.tar.gz -s -o - | tar -xzf -
RUN mv hadoop-2.* hadoop
ENV HADOOP_HOME /opt/hadoop



# Setup
WORKDIR /opt/hadoop
ENV PATH /opt/hadoop/bin:/opt/hadoop/sbin:$PATH
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
RUN sed --in-place='.ori' -e "s/\${JAVA_HOME}/\/usr\/lib\/jvm\/java-7-openjdk-amd64/" etc/hadoop/hadoop-env.sh


# Pseudo-Distributed Operation
COPY conf/datanode/core-site.xml etc/hadoop/data-node-core-site.xml
COPY conf/datanode/hdfs-site.xml etc/hadoop/data-node-hdfs-site.xml
COPY conf/namenode/core-site.xml etc/hadoop/name-node-core-site.xml
COPY conf/namenode/hdfs-site.xml etc/hadoop/name-node-hdfs-site.xml
COPY conf/namenode/yarn-site.xml etc/hadoop/yarn-site.xml
COPY conf/namenode/mapred-site.xml etc/hadoop/mapred-site.xml

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
