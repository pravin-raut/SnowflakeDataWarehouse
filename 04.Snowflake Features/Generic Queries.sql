
-- 1. Retrieve Results of the Last Query Executed in the Session
SELECT * 
FROM TABLE(RESULT_SCAN(LAST_QUERY_ID()));


-- 2. Retrieve the Results of a Specific Past Query
Replace `'your_query_id'` with the actual query ID.
SELECT * 
FROM TABLE(RESULT_SCAN('your_query_id'));


-- 3. Check the Size of a Table
This query returns the number of bytes used by a table.
SELECT table_name, bytes
FROM information_schema.tables
WHERE table_schema = 'YOUR_SCHEMA' AND table_name = 'YOUR_TABLE';


-- 4. Retrieve Execution Plan of the Last Query
EXPLAIN USING LAST_QUERY_ID();


-- 5. List the 10 Most Recent Queries Executed by a Specific User
Replace `'your_username'` with the actual username.
SELECT query_text, start_time, end_time
FROM table(information_schema.query_history())
WHERE user_name = 'your_username'
ORDER BY start_time DESC
LIMIT 10;


-- 6. Get DDL of an Object (e.g., Table)
Replace `'your_table_name'` with the actual table name.
SELECT GET_DDL('TABLE', 'your_table_name');



-- 7. List the Average Query Runtime in the Last 24 Hours
SELECT AVG(execution_time)
FROM table(information_schema.query_history(dateadd('hours',-24,current_timestamp())))
WHERE execution_status = 'SUCCESS';


-- 8. Monitor Snowflake Credit Usage
SELECT SUM(credits_used) AS total_credits_used
FROM snowflake.account_usage.warehouse_metering_history
WHERE start_time >= dateadd('days', -30, current_date);


-- 9. Get the Current Account Parameters
SHOW PARAMETERS;


-- 10. View Recent Data Load History
SELECT *
FROM table(information_schema.copy_history(table_name => 'YOUR_SCHEMA.YOUR_TABLE', start_time => dateadd(hours, -4, current_timestamp())));


