#!/bin/bash

cd /

#mkdir content

cd content/ 

apt-get install openjdk-8-jdk-headless -qq > /dev/null

wget http://apache.crihan.fr/dist/spark/spark-2.4.4/spark-2.4.4-bin-hadoop2.7.tgz

tar xf spark-2.4.4-bin-hadoop2.7.tgz

pip install -q findspark

pip install spark-nlp


export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export SPARK_HOME=/content/spark-2.4.4-bin-hadoop2.7


# Create a local Spark Session

import findspark
findspark.init()
from pyspark.sql import SparkSession
spark = SparkSession.builder.master("local[*]").getOrCreate()

# Test Installation 

df = spark.createDataFrame([{"Google": "Colab","Spark": "Scala"} ,{"Google": "Dataproc","Spark":"Python"}])
df.show()
