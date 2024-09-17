# Databricks notebook source
# MAGIC %sh
# MAGIC pip install azure-mgmt-databricks
# MAGIC pip install azure-identity

# COMMAND ----------

# MAGIC %sh
# MAGIC pip install azure-mgmt-datafactory
# MAGIC pip install azure-identity 

# COMMAND ----------

from azure.identity import ManagedIdentityCredential, CredentialUnavailableError

# COMMAND ----------

from azure.core.exceptions import ClientAuthenticationError

managed_identity = ManagedIdentityCredential()

try:
    token = managed_identity.get_token('40cadd47-b886-455e-9ec7-b4b163e34093/.default')
    print(token)
except CredentialUnavailableError as e:
    print('Error message ==> {}'.format(e.message))
    print('Error response ==> {}'.format(e.response))
except ClientAuthenticationError as e:
    print('Error message ==> {}'.format(e.message))
    print('Error response ==> {}'.format(e.response))

