#!/bin/bash

wget http://apache.mirrors.hoobly.com/drill/drill-1.10.0/apache-drill-1.10.0.tar.gz
tar -xzvf apache-drill-1.10.0.tar.gz

ZKHOSTS=`grep -R zookeeper /etc/hadoop/conf/yarn-site.xml | grep 2181 | grep -oPm1 "(?<=<value>)[^<]+"`
if [ -z "$ZKHOSTS" ]; then
    ZKHOSTS=`grep -R zk /etc/hadoop/conf/yarn-site.xml | grep 2181 | grep -oPm1 "(?<=<value>)[^<]+"`
fi

cp /etc/hadoop/conf/core-site.xml $HOME/apache-drill-1.10.0/conf/core-site.xml

sed -i "s@localhost:2181@$ZKHOSTS@" apache-drill-1.10.0/conf/drill-override.conf
$HOME/apache-drill-1.10.0/bin/drillbit.sh restart
