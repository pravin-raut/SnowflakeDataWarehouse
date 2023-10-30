use database retail;
use schema stg;

drop STORAGE INTEGRATION if exists  azure_integration;
  CREATE STORAGE INTEGRATION azure_integration
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = AZURE
  ENABLED = TRUE
  AZURE_TENANT_ID = 'cc5fcbb6-dce0-40b4-ba9f-40a62abbc6ed'
  STORAGE_ALLOWED_LOCATIONS = ('azure://mktbaskdevanaluk01sa.blob.core.windows.net/retaildata/');


  desc storage INTEGRATION azure_integration