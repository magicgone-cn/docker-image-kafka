#!/bin/sh

cd /kafka || exit
# start zookeeper
nohup zookeeper-server-start.sh config/zookeeper.properties > /dev/null 2>&1 &
# start kafka
kafka-server-start.sh config/server.properties
