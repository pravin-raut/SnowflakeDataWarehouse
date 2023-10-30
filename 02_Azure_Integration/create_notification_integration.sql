use database RETAIL;
use schema stg;


CREATE NOTIFICATION INTEGRATION azure_notification_integration
  TYPE = QUEUE
  ENABLED = TRUE
  NOTIFICATION_PROVIDER = AZURE_STORAGE_QUEUE
  AZURE_STORAGE_QUEUE_PRIMARY_URI = 'https://mktbaskdevanaluk01sa.queue.core.windows.net/snowflake-data-queue'
  AZURE_TENANT_ID = 'cc5fcbb6-dce0-40b4-ba9f-40a62abbc6ed';

--Register integration
DESC INTEGRATION azure_notification_integration;
