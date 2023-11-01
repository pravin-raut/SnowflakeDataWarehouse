USE DATABASE RETAIL;
USE SCHEMA STG;

-- Create a new table named 'sales_raw' with an integer ID and a VARCHAR name.
CREATE OR REPLACE TABLE sales_raw (
    id INT,
    name VARCHAR(10)
);

-- Enable change tracking on the 'sales_raw' table. This allows for tracking changes to the data in this table.
ALTER TABLE sales_raw 
SET CHANGE_TRACKING = TRUE;

-- Insert a record into 'sales_raw'.
INSERT INTO sales_raw VALUES(1, 'Pravin');

-- Query to show changes in the 'sales_raw' table. This method shows the default change information, looking back for 30 seconds (0.5 minutes).
SELECT * FROM sales_raw
CHANGES(INFORMATION => DEFAULT)
AT (OFFSET => -0.5 * 60);

-- Insert another record into 'sales_raw'.
INSERT INTO sales_raw VALUES(2, 'Akshata');

-- Display the current timestamp. Useful for understanding the temporal context for subsequent queries.
SELECT CURRENT_TIMESTAMP;

-- Query to show changes in the 'sales_raw' table at a specific timestamp. This will show changes until the specified timestamp.
SELECT * FROM sales_raw
CHANGES(INFORMATION => DEFAULT)
AT (TIMESTAMP => '2023-11-01 03:02:06.187 -0700'::TIMESTAMP_TZ);

-- Update the record in 'sales_raw' where id=2. This demonstrates how changes are captured when using change tracking.
UPDATE sales_raw
SET name = 'Oju'
WHERE id = 2;

-- Query to show changes with 'append_only' information. This option tracks only the append operations (like INSERTs) and ignores updates or deletes.
SELECT * FROM sales_raw
CHANGES(INFORMATION => APPEND_ONLY)
AT (TIMESTAMP => '2023-11-01 03:02:06.187 -0700'::TIMESTAMP_TZ);
