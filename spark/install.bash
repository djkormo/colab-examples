#!/bin/bash

cd /

mkdir -p content

cd content/ 

apt-get install openjdk-8-jdk-headless
wget http://apache.crihan.fr/dist/spark/spark-2.4.4/spark-2.4.4-bin-hadoop2.7.tgz

tar xf spark-2.4.4-bin-hadoop2.7.tgz

pip install -q findspark
pip install spark-nlp

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export SPARK_HOME=export SPARK_HOME=/content/spark-2.4.4-bin-hadoop2.7
