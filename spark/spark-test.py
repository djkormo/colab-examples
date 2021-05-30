import os
os.environ["JAVA_HOME"] = "/usr/lib/jvm/java-8-openjdk-amd64"
os.environ["SPARK_ME"] = "/content/spark-2.4.8-bin-hadoop2.7"
# Create a local Spark Session

import findspark
findspark.init("spark-2.4.8-bin-hadoop2.7")
from pyspark.sql import SparkSession

from pyspark.sql import SparkSession
spark = SparkSession.builder.master("local[*]").getOrCreate()

# Test Installation 

df = spark.createDataFrame([{"Google": "Colab","Spark": "Scala"} ,{"Google": "Dataproc","Spark":"Python"}])
df.show()

