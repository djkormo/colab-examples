import os
os.environ["JAVA_HOME"] = "/usr/lib/jvm/java-8-openjdk-amd64"
os.environ["SPARK_ME"] = "/content/spark-2.4.4-bin-hadoop2.7"

import findspark
findspark.init()
from pyspark.sql import SparkSession

import sparknlp 
spark = sparknlp.start()
from sparknlp.pretrained import PretrainedPipeline
pipeline = PretrainedPipeline('recognize_entities_dl', 'en')
result = pipeline.annotate('Harry Potter is a great movie')
print(result['ner'])
pipeline = PretrainedPipeline('analyze_sentiment', 'en')
result = pipeline.annotate('Harry Potter is a great movie')
print(result['sentiment'])


# Create a local Spark Session

import findspark
findspark.init()
from pyspark.sql import SparkSession
spark = SparkSession.builder.master("local[*]").getOrCreate()

# Test Installation 

df = spark.createDataFrame([{"Google": "Colab","Spark": "Scala"} ,{"Google": "Dataproc","Spark":"Python"}])
df.show()
