#!/bin/sh

cd $KAFKA_HOME || exit

# update config
sed -i "s/#advertised.listeners=PLAINTEXT:\/\/your.host.name:9092/advertised.listeners=PLAINTEXT:\/\/host.docker.internal:9092/g" config/server.properties

# start zookeeper
nohup zookeeper-server-start.sh config/zookeeper.properties > /dev/null 2>&1 &
# start kafka
kafka-server-start.sh config/server.properties
