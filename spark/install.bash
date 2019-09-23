#!/bin/bash

apt-get install openjdk-8-jdk-headless -qq > /dev/null
wget -q http://apache.crihan.fr/dist/spark/spark-2.4.4/spark-2.4.4-bin-hadoop2.7.tgz
tar xf spark-2.4.4-bin-hadoop2.7.tgz
pip install -q findspark
pip install spark-nlp