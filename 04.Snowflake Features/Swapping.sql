USE DATABASE RETAIL;
USE SCHEMA STG;

-- Check the current data before and after cloning and swapping operations.
SELECT * FROM stg_store;

-- Create a new table 'stg_store_prod' by cloning 'stg_store'.
-- Cloning creates an exact copy of the table, including its data, without any additional storage cost at the time of cloning.
-- This is beneficial for creating test environments, backups, or quick iterations.
CREATE TABLE stg_store_prod
CLONE stg_store;

-- Select records from the newly cloned table 'stg_store_prod' where storeid equals 1.
-- This can be used to verify that the clone operation was successful and that the data matches the original.
SELECT * FROM stg_store_prod WHERE storeid = 1;

-- Swap the contents and metadata (like ownership, grants, etc.) of 'stg_store_prod' and 'stg_store'.
-- After this operation, 'stg_store' will contain what was in 'stg_store_prod' and vice versa.
-- Swapping is useful for atomic and quick promotion of data from staging to production environments or for switching between datasets.
ALTER TABLE stg_store_prod
SWAP WITH stg_store;

-- Post-swap, verify the data to ensure the swap has taken effect as expected.
SELECT * FROM stg_store;
SELECT * FROM stg_store_prod;
