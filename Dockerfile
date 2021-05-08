FROM centos:7

# install jdk
RUN yum install -y java-1.8.0-openjdk.x86_64

ENV KAFKA_HOME=/opt/kafka
ENV TZ Asia/Shanghai
ENV PATH ${PATH}:${KAFKA_HOME}/bin

COPY kafka_2.13-2.8.0.tgz /tmp

WORKDIR /tmp

RUN tar -xzf kafka_2.13-2.8.0.tgz \
    && rm -f kafka_2.13-2.8.0.tgz \
    && mv kafka_2.13-2.8.0 ${KAFKA_HOME}

WORKDIR ${KAFKA_HOME}

CMD ["kafka-server-start.sh","config/server.properties"]

EXPOSE 9092
