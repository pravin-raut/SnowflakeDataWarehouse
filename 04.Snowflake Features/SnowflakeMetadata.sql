Snowflake offers a variety of system-defined views and functions that can be used to query metadata about different database objects. Here are ten commonly used queries for accessing metadata related to tables, stored procedures, tasks, pipes, queues, views, and more:

-- 1. List All Tables in a Schema
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'YOUR_SCHEMA'
  AND table_catalog = 'YOUR_DATABASE';
```

-- 2. List All Columns in a Table
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'YOUR_TABLE'
  AND table_schema = 'YOUR_SCHEMA';
```

-- 3. List All Views in a Schema
SELECT table_name AS view_name
FROM information_schema.tables
WHERE table_schema = 'YOUR_SCHEMA'
  AND table_type = 'VIEW';
```

-- 4. List All Stored Procedures
SHOW PROCEDURES;
-- or for a specific database/schema
SHOW PROCEDURES IN YOUR_DATABASE.YOUR_SCHEMA;


-- 5. List All Tasks
SHOW TASKS;
-- or for a specific database/schema
SHOW TASKS IN YOUR_DATABASE.YOUR_SCHEMA;


-- 6. List All Snowflake Stages
SHOW STAGES;
-- or for a specific database/schema
SHOW STAGES IN YOUR_DATABASE.YOUR_SCHEMA;


-- 7. List All Pipes
SHOW PIPES;
-- or for a specific database/schema
SHOW PIPES IN YOUR_DATABASE.YOUR_SCHEMA;


-- 8. Get Details of Specific Pipe
DESC PIPE your_pipe_name;


-- 9. List All Streams
SHOW STREAMS;
-- or for a specific database/schema
SHOW STREAMS IN YOUR_DATABASE.YOUR_SCHEMA;


-- 10. Check Query History
SELECT query_id, query_text, execution_status, start_time, end_time
FROM table(information_schema.query_history())
WHERE query_type = 'SELECT'
ORDER BY start_time DESC
LIMIT 10;



-- 11. List All Users

SHOW USERS;


-- 12. List All Roles

SHOW ROLES;


-- 13. List Grants for a Specific Role

SHOW GRANTS TO ROLE your_role_name;


-- 14. List Grants on a Specific Table

SHOW GRANTS ON TABLE your_table_name;


-- 15. List All Warehouses

SHOW WAREHOUSES;


-- 16. List Usage Statistics of a Warehouse

SELECT *
FROM information_schema.warehouse_load_history
WHERE warehouse_name = 'YOUR_WAREHOUSE';


-- 17. List All Databases

SHOW DATABASES;


-- 18. Find Running Queries

SELECT query_id, query_text, start_time
FROM table(information_schema.query_history())
WHERE execution_status = 'RUNNING';


-- 19. List All File Formats

SHOW FILE FORMATS;
-- or for a specific database/schema
SHOW FILE FORMATS IN YOUR_DATABASE.YOUR_SCHEMA;


-- 20. List All External Tables

SHOW EXTERNAL TABLES;
-- or for a specific database/schema
SHOW EXTERNAL TABLES IN YOUR_DATABASE.YOUR_SCHEMA;


-- 21. List All Materialized Views

SHOW MATERIALIZED VIEWS;
-- or for a specific database/schema
SHOW MATERIALIZED VIEWS IN YOUR_DATABASE.YOUR_SCHEMA;


-- 22. Data Sharing - Outbound Shares

SHOW SHARES;


-- 23. Data Sharing - Inbound Shares

SHOW IMPORTED DATABASES;


-- 24. List All Schemas in a Database

SHOW SCHEMAS IN YOUR_DATABASE;


-- 25. List Resource Monitors

SHOW RESOURCE MONITORS;


-- 26. Check Storage Usage by Table

SELECT table_name, active_bytes
FROM information_schema.table_storage_metrics
WHERE table_schema = 'YOUR_SCHEMA';


-- 27. List Functions

SHOW FUNCTIONS;
-- or for a specific database/schema
SHOW FUNCTIONS IN YOUR_DATABASE.YOUR_SCHEMA;


-- 28. List Sequences

SHOW SEQUENCES;
-- or for a specific database/schema
SHOW SEQUENCES IN YOUR_DATABASE.YOUR_SCHEMA;


-- 29. Check Recent Login History

SELECT user_name, login_time, client_ip
FROM table(information_schema.login_history())
ORDER BY login_time DESC
LIMIT 10;


-- 30. List All Clusters 

SHOW CLUSTERS;

