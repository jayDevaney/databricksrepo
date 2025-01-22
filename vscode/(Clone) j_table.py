
from pyspark.sql import SparkSession
from pyspark.sql.types import *

spark = SparkSession.builder.getOrCreate()
   
   
   # Define the schema
schema = StructType([
   StructField('CustomerID', IntegerType(), False),
   StructField('FirstName',  StringType(),  False),
   StructField('LastName',   StringType(),  False)
])

data = [
   [ 1000, 'Meryl', 'Wakefield' ],
   [ 1001, 'Nathan',   'Alexander' ],
   [ 1002, 'Patrick',   'Grimes' ],
   [ 1003, 'Evelyn',   'Parks' ],
   [ 1004, 'Martin',   'Bedford' ],
   [ 1005, 'Daniel',    'Hilton' ],
   [ 1006, 'Edward',    'Forest'  ],
   [ 1007, 'Abigail',    'Archer' ],
   [ 1008, 'Jonas',    'Whitaker' ],
   [ 1009, 'Ezra',    'Porter' ],
   [ 1010, 'Margaret',    'Hathaway'],
   [ 1011, 'Katherine',    'Chambers' ]
]

 # Load the data into a DataFrame
customers = spark.createDataFrame(data, schema)
 

   # Save the DataFrame as a table
customers.write.saveAsTable("main.default.people_15m")



