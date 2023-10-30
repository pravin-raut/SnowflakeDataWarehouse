use database retail;
use schema stg;

CREATE OR REPLACE STAGE my_external_stage
  URL = 'azure://mktbaskdevanaluk01sa.blob.core.windows.net/retaildata/'
  STORAGE_INTEGRATION = azure_integration
  FILE_FORMAT = csv_format;



  list @my_external_stage/customer/



select '86400' as date_String,date(date_string::int) as date_int


select current_timestamp_