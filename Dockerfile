FROM centos:7

# install jdk
RUN yum install -y java-1.8.0-openjdk.x86_64

# install kafka
RUN curl https://apache.website-solution.net/kafka/2.7.0/kafka_2.13-2.7.0.tgz -o kafka_2.13-2.7.0.tgz \
    && tar -xzf kafka_2.13-2.7.0.tgz \
    && rm -f kafka_2.13-2.7.0.tgz \
    && mv kafka_2.13-2.7.0 /kafka

# 时区 上海
ENV TZ Asia/Shanghai
ENV PATH="${PATH}:/kafka/bin"

COPY entrypoint.sh /kafka/entrypoint.sh

WORKDIR /kafka

CMD ["./entrypoint.sh"]

EXPOSE 9092
