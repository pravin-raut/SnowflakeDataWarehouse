USE DATABASE RETAIL;
USE SCHEMA STG;

-- Copy data from an external stage into the stg_Payment table.
COPY INTO stg_Payment (PaymentMethod, PaymentId)
FROM (
    SELECT s.$1, s.$2
    FROM @my_external_stage/payment/ s
)
FILE_FORMAT = (FORMAT_NAME = csv_format);

-- Select all records from stg_Payment.
SELECT * FROM stg_Payment;

-- Update the payment method in stg_Payment to 'Cash'.
UPDATE stg_Payment
SET PaymentMethod = 'Cash';

-- Demonstrating Time Travel to query historical data using different methods.
-- Method 1: Using an OFFSET to go back 1 hour.
SELECT * FROM stg_Payment AT (OFFSET => -60*60);

-- Method 2: Using a specific timestamp.
SELECT * FROM stg_Payment BEFORE (TIMESTAMP => '2023-10-28 22:00:00'::TIMESTAMP);

-- Method 3: Using the statement ID of the update query.
SELECT * FROM stg_payment BEFORE (STATEMENT => '01aff738-0000-2a08-0000-5de90001010a');

-- Resetting the stg_Payment table to its state before the update.
TRUNCATE TABLE stg_payment;
INSERT INTO stg_payment
SELECT * FROM stg_payment BEFORE (STATEMENT => '01aff738-0000-2a08-0000-5de90001010a');

-- Demonstrating the DROP and UNDROP commands.
DROP TABLE stg_payment;
UNDROP TABLE stg_payment;

-- Showing how to view and alter the data retention time of a table.
SHOW TABLES LIKE 'stg_payment';
ALTER TABLE stg_payment SET DATA_RETENTION_TIME_IN_DAYS = 2;

-- Re-creating the stg_Payment table with data retention settings.
CREATE OR REPLACE TABLE stg_Payment (
    PaymentId INT,
    PaymentMethod VARCHAR(50)
)
DATA_RETENTION_TIME_IN_DAYS = 2;

-- Querying Snowflake storage usage.
SELECT * FROM snowflake.account_usage.storage_usage;
SELECT * FROM snowflake.account_usage.table_storage_metrics;

-- Understanding Fail-Safe in Snowflake.
/*
   Fail-Safe is a non-configurable, additional 7-day period of data protection beyond the Time Travel period. It is only accessible by Snowflake Support for disaster recovery and contributes to storage costs.
*/
