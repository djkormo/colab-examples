#!/bin/bash

# based on https://tecadmin.net/setup-hadoop-on-ubuntu/


# adding user 
adduser --disabled-password --gecos "" hadoop


su - hadoop
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys

ssh  localhost

# exit 

# downlading hadoop software
cd ~
wget http://www-eu.apache.org/dist/hadoop/common/hadoop-3.1.2/hadoop-3.1.2.tar.gz
tar xzf hadoop-3.1.2.tar.gz
mv hadoop-3.1.2 hadoop

# adding envoronment variables to  
echo 'export HADOOP_HOME=/home/hadoop/hadoop' >>   ~/.bashrc
echo 'export HADOOP_INSTALL=$HADOOP_HOME' >>   ~/.bashrc
echo 'export HADOOP_MAPRED_HOME=$HADOOP_HOME' >>   ~/.bashrc
echo 'export HADOOP_COMMON_HOME=$HADOOP_HOME' >>   ~/.bashrc
echo 'export HADOOP_HDFS_HOME=$HADOOP_HOME' >>   ~/.bashrc
echo 'export YARN_HOME=$HADOOP_HOME' >>   ~/.bashrc
echo 'export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native' >>   ~/.bashrc
echo 'export PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin' >>  ~/.bashrc


source ~/.bashrc


cat $HADOOP_HOME/etc/hadoop/hadoop-env.sh


echo 'export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64' >> $HADOOP_HOME/etc/hadoop/hadoop-env.sh



cat $HADOOP_HOME/etc/hadoop/core-site.xml
cat $HADOOP_HOME/etc/hadoop/core-hdfs.xml
cat $HADOOP_HOME/etc/hadoop/mapred-site.xml
cat $HADOOP_HOME/etc/hadoop/yarn-site.xml

cp core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml
cp core-hdfs.xml $HADOOP_HOME/etc/hadoop/core-hdfs.xml
cp mapred-site.xml $HADOOP_HOME/etc/hadoop/mapred-site.xml
cp yarn-site.xml $HADOOP_HOME/etc/hadoop/yarn-site.xml


hdfs namenode -format
### RESTARTING VM !!!!

cd $HADOOP_HOME/sbin/

./start-dfs.sh

./start-yarn.sh




sudo apt-get install openssh-server openssh-client