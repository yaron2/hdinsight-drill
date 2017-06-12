#!/bin/bash

mkdir -p /var/lib/drill
chmod -R 777 /var/lib/drill/

cd /var/lib/drill

wget http://apache.mirrors.hoobly.com/drill/drill-1.10.0/apache-drill-1.10.0.tar.gz
tar -xzvf apache-drill-latest.tar.gz

mkdir -p /var/lib/drill/apache-drill-latest/jars/3rdparty
cd /var/lib/drill/apache-drill-latest/jars/3rdparty

sudo wget http://central.maven.org/maven2/org/apache/hadoop/hadoop-azure/2.7.1/hadoop-azure-2.7.1.jar
sudo wget http://central.maven.org/maven2/com/microsoft/azure/azure-storage/2.0.0/azure-storage-2.0.0.jar

cd /var/lib/drill

ZKHOSTS=`grep -R zookeeper /etc/hadoop/conf/yarn-site.xml | grep 2181 | grep -oPm1 "(?<=<value>)[^<]+"`
if [ -z "$ZKHOSTS" ]; then
    ZKHOSTS=`grep -R zk /etc/hadoop/conf/yarn-site.xml | grep 2181 | grep -oPm1 "(?<=<value>)[^<]+"`
fi

sed -i "s@localhost:2181@$ZKHOSTS@" apache-drill-latest/conf/drill-override.conf
ln -s /etc/hadoop/conf/core-site.xml apache-drill-latest/conf/core-site.xml
apache-drill-latest/bin/drillbit.sh autorestart
