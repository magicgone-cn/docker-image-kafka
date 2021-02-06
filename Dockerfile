FROM centos:7

# install jdk
RUN yum install -y java-1.8.0-openjdk.x86_64

ENV KAFKA_HOME=/opt/kafka

# install kafka
RUN curl https://apache.website-solution.net/kafka/2.7.0/kafka_2.13-2.7.0.tgz -o kafka_2.13-2.7.0.tgz \
    && tar -xzf kafka_2.13-2.7.0.tgz \
    && rm -f kafka_2.13-2.7.0.tgz \
    && mv kafka_2.13-2.7.0 ${KAFKA_HOME}

# 时区 上海
ENV TZ Asia/Shanghai
ENV PATH ${PATH}:${KAFKA_HOME}/bin
# 有bug,目前使用host.docker.internal:9092
ENV ADVERTISED_LISTENERS localhost:9092

COPY entrypoint.sh ${KAFKA_HOME}/entrypoint.sh

WORKDIR ${KAFKA_HOME}

CMD ["./entrypoint.sh"]

EXPOSE 9092
