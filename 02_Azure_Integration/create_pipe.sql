use database RETAIL;
use schema stg;


/*
1. Storage INtergation
2. Create Stage
3. Queue + Notification
4. Notification Integration
5. Create Pipe


*/
CREATE OR REPLACE PIPE store_pipe
AUTO_INGEST = TRUE
integration=azure_notification_integration
AS
COPY INTO stg_Store
FROM 
 @my_external_stage/store/
FILE_FORMAT = csv_format;



select * from stg_Store

LIST @my_external_stage/store;


