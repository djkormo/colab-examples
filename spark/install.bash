#!/bin/bash

cd /

mkdir content

cd content/ 

apt-get install openjdk-8-jdk-headless
wget http://apache.crihan.fr/dist/spark/spark-2.4.4/spark-2.4.4-bin-hadoop2.7.tgz

tar xvf spark-2.4.4-bin-hadoop2.7.tgz

mv spark-2.4.4-bin-hadoop2.7/ /opt/spark 

pip install -q findspark
pip install spark-nlp

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export SPARK_HOME=/opt/spark 
