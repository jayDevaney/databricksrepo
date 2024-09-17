-- Databricks notebook source
-- MAGIC %md
-- MAGIC #### Query data in Unity Catalog Schema ####

-- COMMAND ----------

SELECT * FROM demo.demo_schema.circuits;

-- COMMAND ----------

use CATALOG demo;
USE SCHEMA demo_schema;
create table circuits_mgd as
select * from circuits;

-- COMMAND ----------

SELECT current_catalog();
SELECT current_schema();

-- COMMAND ----------

SHOW CATALOGS;
SHOW TABLES;
