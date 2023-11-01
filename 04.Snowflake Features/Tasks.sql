USE DATABASE RETAIL;
USE SCHEMA STG;

-- Creating a customers table with an autoincrementing ID, a default first name, and a timestamp.
CREATE OR REPLACE TABLE customers (
  customer_id INT AUTOINCREMENT START=1 INCREMENT=1,
  first_name VARCHAR(40) DEFAULT 'Pravin',
  create_timestamp TIMESTAMP
);

-- Creating a second customers table with similar structure but a different default first name.
CREATE OR REPLACE TABLE customers2 (
  customer_id INT AUTOINCREMENT START=1 INCREMENT=1,
  first_name VARCHAR(40) DEFAULT 'akshata',
  create_timestamp TIMESTAMP
);

-- Creating a third customers table, same as the second.
CREATE OR REPLACE TABLE customers3 (
  customer_id INT AUTOINCREMENT START=1 INCREMENT=1,
  first_name VARCHAR(40) DEFAULT 'akshata',
  create_timestamp TIMESTAMP
);

-- Creating a process table for controlling the task execution.
CREATE TABLE process (
  id INT
);
INSERT INTO process VALUES (1);

-- Does not work with a table in when clause
CREATE OR REPLACE TASK customer_insert
  WAREHOUSE = compute_wh
  SCHEDULE = '1 MINUTE'
  WHEN (
    SELECT CASE WHEN MAX(id) = 1 THEN TRUE ELSE FALSE END
    FROM process
  )
AS
  INSERT INTO customers(create_timestamp)
  VALUES(CURRENT_TIMESTAMP);

-- Creating another task with a specific CRON schedule.
CREATE OR REPLACE TASK cusomter_insert_new
  WAREHOUSE = compute_wh
  SCHEDULE = 'USING CRON 6-8 21 * * 1-5 UTC';
SHOW TASKS;

-- Resuming and suspending the first task.
ALTER TASK customer_insert RESUME;
ALTER TASK customer_insert SUSPEND;

-- Selecting all records from the customers table to view the inserted data.
SELECT * FROM customers;

-- Creating a chained task that runs after 'customer_insert' and inserts data from customers into customers2.
CREATE OR REPLACE TASK customer_insert2
  WAREHOUSE = compute_wh
  AFTER customer_insert
AS
  INSERT INTO customers2 SELECT * FROM customers;

-- Creating another chained task that runs after both 'customer_insert' and 'customer_insert2', copying data from customers2 to customers3.
CREATE OR REPLACE TASK customer_insert3
  WAREHOUSE = compute_wh
  AFTER customer_insert, customer_insert2
AS
  INSERT INTO customers3 SELECT * FROM customers2;

-- Display all existing tasks and the current data in the customers2 table.
SHOW TASKS;
SELECT * FROM customers2;
