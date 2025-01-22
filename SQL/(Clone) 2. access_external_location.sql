-- Databricks notebook source
-- MAGIC %python
-- MAGIC
-- MAGIC #new
-- MAGIC dbutils.fs.ls('abfss://silver@databricksucdlextcg5.dfs.core.windows.net/')

-- COMMAND ----------

use catalog silver

-- COMMAND ----------


CREATE SCHEMA IF NOT EXISTS demo_silver
MANAGED LOCATION "abfss://silver@databricksucdlextcg5.dfs.core.windows.net/"

-- COMMAND ----------

use schema demo_silver

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS circuits3
(
  circuitId INT,
  circuitRef STRING,
  name STRING,
  location STRING,
  country STRING,
  lat STRING,
  lng STRING,
  alt INT,
  url STRING

)
using CSV
OPTIONS (path "abfss://silver@databricksucdlextcg5.dfs.core.windows.net/circuits.csv");

-- COMMAND ----------

select * from circuits;

-- COMMAND ----------

CREATE EXTERNAL LOCATION databricksucdlextcg5_subbronze
URL 'abfss://sub-bronze@databricksucdlextcg5.dfs.core.windows.net/'
WITH (STORAGE CREDENTIAL `dbx-ext-storage-cred`);

-- COMMAND ----------

SHOW EXTERNAL LOCATIONS;

-- COMMAND ----------

DESC EXTERNAL LOCATION databricksucdlextcg5_bronze;

-- COMMAND ----------

CREATE CATALOG IF NOT EXISTS formula1_dev;
USE CATALOG formula1_dev;


-- COMMAND ----------

CREATE SCHEMA IF NOT EXISTS bronze
EXTERNAL LOCATION "abfss://bronze@databricksucdlextcg5.dfs.core.windows.net/"

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS formula1_dev.bronze.drivers
(
  driverId INT,
  driverRef STRING,
  code STRING,
  name STRUCT<forename: STRING, surname: STRING>,
  dob DATE,
  nationality STRING,
  url STRING

)
using JSON
OPTIONS (path "abfss://bronze@databricksucdlextcg5.dfs.core.windows.net/driver.json");

-- COMMAND ----------

USE CATALOG formula1_dev;
USE SCHEMA bronze;
SHOW TABLES;

-- COMMAND ----------

select * from bronze.drivers;

-- COMMAND ----------

create table credit_fm.bronze.test;
