# Databricks notebook source
display(dbutils.fs.ls("/databricks-datasets/wine-quality/"))

# COMMAND ----------

df = spark.read.csv("dbfs:/databricks-datasets/wine-quality/winequality-red.csv", header=True, sep=";")
display(df)

# COMMAND ----------

 
# Should return private ip according to the entry in the Private DNS Zone when PE is still active
 %sh
 nslookup yourstorageaccountPE.privatelink.blob.core.windows.net

# COMMAND ----------


# Returns IP and additional DNS information
%sh
dig +short yourstorageaccountPE.privatelink.blob.core.windows.net
