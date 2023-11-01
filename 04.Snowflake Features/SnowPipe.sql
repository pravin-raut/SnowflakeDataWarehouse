USE DATABASE RETAIL;
USE SCHEMA STG;

-- Describe the 'store_pipe' to view its configuration and metadata.
DESC PIPE store_pipe;

-- List all pipes available in the current schema/database context.
SHOW PIPES;

-- Retrieve the current status of 'store_pipe'.
SELECT SYSTEM$PIPE_STATUS('store_pipe');

-- Retrieve the history of COPY operations performed by 'store_pipe' within the last hour.
-- This can be useful for monitoring and debugging purposes.
SELECT * FROM TABLE(INFORMATION_SCHEMA.COPY_HISTORY(TABLE_NAME => 'stg_Store', START_TIME => dateadd('hours', -1, current_timestamp())));

-- List the files in the specified stage path.
--LIST @my_external_stage/store;

-- Refresh the pipe to process any data files that have landed in the stage since the last pipe execution.
ALTER PIPE store_pipe REFRESH;

-- Truncate the 'stg_Store' table. Useful for clearing the table's data before loading new data.
TRUNCATE TABLE stg_Store;

-- Pause the pipe execution. Recommended if the table schema or name is changing to avoid data load issues.
ALTER PIPE store_pipe SET PIPE_EXECUTION_PAUSED = TRUE;

-- Check the status again after pausing the pipe.
SELECT SYSTEM$PIPE_STATUS('store_pipe');

-- To resume or update the pipe, you might need to recreate it using 'CREATE OR REPLACE PIPE'.
-- This allows for modifications without losing the metadata or existing setup.
