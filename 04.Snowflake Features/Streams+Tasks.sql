-- Use the 'retail' database and 'stg' schema
USE DATABASE retail;
USE SCHEMA stg;

-- 1. Create or replace a task named 'store_changes' 
--    This task is scheduled to run every minute and merges changes from the STG_STORE_STREAM to the core_Store table
CREATE OR REPLACE TASK store_changes
WAREHOUSE = compute_wh
SCHEDULE = '1 MINUTE'
WHEN SYSTEM$STREAM_HAS_DATA('STG_STORE_STREAM')
AS
    MERGE INTO core_Store AS target
    USING STG_STORE_STREAM AS source
    ON target.storeid = source.storeid
    WHEN MATCHED AND METADATA$ACTION = 'INSERT' AND METADATA$ISUPDATE THEN 
        UPDATE SET target.storelocation = source.storelocation
    WHEN NOT MATCHED AND METADATA$ACTION = 'INSERT' THEN 
        INSERT (storeid, storelocation) VALUES (source.storeid, source.storelocation);

-- 2. Display the current data in the STG_STORE_STREAM
SELECT * FROM STG_STORE_STREAM;

-- 3. Resume the task to start executing as per its schedule
ALTER TASK store_changes RESUME;

-- 4. Show a list of tasks to verify the 'store_changes' task
SHOW TASKS;

-- 5. Create or replace a stream on the stg_Store table
--    This stream captures changes made to the stg_Store table
CREATE OR REPLACE STREAM STG_STORE_STREAM ON TABLE stg_Store;

-- 6. Show a list of streams to verify the 'STG_STORE_STREAM'
SHOW STREAMS;

-- 7. Insert a new record into the stg_Store table
INSERT INTO stg_Store VALUES (3, 'NY');

-- 8. Show the updated data in the stg_Store table
SELECT * FROM stg_Store;

-- 9. Update a record in the stg_Store table
UPDATE stg_Store
SET storelocation = 'Dom'
WHERE storeid = 1;

-- 10. Display the data in the core_Store table to see the effect of the task and stream
SELECT * FROM core_Store;

-- 11. Query the task history for the 'store_changes' task
--     This returns the last 100 task executions, showing when each execution was scheduled
SELECT *
FROM TABLE(INFORMATION_SCHEMA.TASK_HISTORY(TASK_NAME => 'store_changes'))
ORDER BY scheduled_time
LIMIT 100;
