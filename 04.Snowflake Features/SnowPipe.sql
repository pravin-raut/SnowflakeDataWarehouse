use database RETAIL;
use schema stg;

desc pipe store_pipe

show pipes;
SELECT SYSTEM$PIPE_STATUS('store_pipe');
SELECT * FROM TABLE(INFORMATION_SCHEMA.COPY_HISTORY(TABLE_NAME => 'stg_Store', START_TIME => dateadd('hours',-1,current_timestamp())));


--list @my_external_stage/store
alter pipe store_pipe refresh
truncate table stg_Store
--If table name is getting changed snowflake recommend to pause pipe
Alter Pipe store_pipe set PIPE_EXECUTION_PAUSED=TRUE

SELECT SYSTEM$PIPE_STATUS('store_pipe');
--Recreate the pipe using create or replace pipe but metadata will not be lost