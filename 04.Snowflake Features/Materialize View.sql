USE DATABASE RETAIL;
USE SCHEMA STG;

-- Creates a materialized view named 'orders_vw' based on the 'stg_Customer' table.
-- Materialized views in Snowflake store pre-computed results of a query and automatically maintain the data as the underlying table changes.
CREATE OR REPLACE MATERIALIZED VIEW orders_vw AS
SELECT * FROM stg_Customer;

-- Displays all materialized views in the current database and schema.
SHOW MATERIALIZED VIEWS;

/*
Comments about Materialized Views:

- Materialized views store query results separately, which incurs additional storage costs.
- They are ideal for scenarios where the underlying data does not change frequently. Frequent changes may lead to higher maintenance costs, making traditional ETL processes more suitable.
- When possible, features like tasks and streams should be preferred for handling real-time data transformations and updates.
- Materialized views are available only in the Enterprise edition of Snowflake.
- There are limitations to the SQL features that can be used in materialized views:
    - Self-joins are not supported.
    - Not all aggregate functions are allowed.
    - User-defined functions (UDFs), HAVING clause, and ORDER BY are not supported.
- Materialized views are beneficial for improving query performance, especially for large, complex queries or when frequent access to pre-computed results is required.
*/
