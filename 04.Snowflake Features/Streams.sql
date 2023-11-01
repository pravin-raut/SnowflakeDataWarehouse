-- Use the specified database and schema
USE DATABASE retail;
USE SCHEMA stg;

-- Drop the existing stg_Store table if it exists, then create a new one
DROP TABLE IF EXISTS stg_Store;
CREATE TABLE stg_Store (
    StoreID INT,
    StoreLocation VARCHAR(100)
);

-- Create a core_Store table to store transformed and enriched data
CREATE TABLE core_Store (
    StoreID INT,
    StoreLocation VARCHAR(100),
    ROW_INS_TS TIMESTAMP,
    ROW_UPD_TS TIMESTAMP
);

-- Create a stream on the stg_Store table to capture changes
CREATE OR REPLACE STREAM STG_STORE_STREAM ON TABLE stg_Store;

-- Insert a record into stg_Store
INSERT INTO stg_Store VALUES (1, 'London');

-- Insert data from stream to core_Store - Note: This statement seems unnecessary here, as the stream will be empty immediately after creation
INSERT INTO core_Store (StoreID, StoreLocation, ROW_INS_TS)
SELECT StoreID, StoreLocation, CURRENT_TIMESTAMP FROM STG_STORE_STREAM;

-- Check the current data in the stream (expected to be empty here)
SELECT * FROM STG_STORE_STREAM;

-- Update a record in stg_Store
UPDATE stg_Store
SET StoreLocation = 'Paris'
WHERE StoreID = 1;

-- Delete a record from stg_Store
DELETE FROM stg_Store WHERE StoreID = 1;

-- View changes in the stream after updates and deletes
SELECT * FROM STG_STORE_STREAM;

-- Merge statement for synchronizing changes from stg_Store to core_Store
-- This statement seems to lack a clause for handling inserts and deletes
MERGE INTO core_Store cs
USING STG_STORE_STREAM ss
ON cs.StoreID = ss.StoreID
WHEN MATCHED 
    AND ss.METADATA$ACTION = 'INSERT' AND ss.METADATA$ISUPDATE
THEN UPDATE
    SET cs.StoreLocation = ss.StoreLocation;

-- Delete statement is redundant since no new records are inserted after the previous delete
DELETE FROM stg_Store WHERE StoreID = 1;

-- Checking stream data again after the merge operation
SELECT * FROM STG_STORE_STREAM;

-- Deleting from core_Store based on deletions captured in the stream
DELETE FROM core_Store WHERE StoreID IN (SELECT StoreID FROM STG_STORE_STREAM WHERE METADATA$ACTION = 'DELETE');

-- Final check of stg_Store table
SELECT * FROM stg_Store;

-- Repopulating stg_Store table and updating the same record, then deleting it
-- These operations will reflect in the stream and can be used for further merge/delete operations
INSERT INTO stg_Store VALUES (1, 'London');
UPDATE stg_Store
SET StoreLocation = 'Paris'
WHERE StoreID = 1;
DELETE FROM stg_Store WHERE StoreID = 1;

-- Check the final state of the stream after all operations
SELECT * FROM STG_STORE_STREAM;


-- Second type of stream is APPEND only default stream captures insert update deletes
Create stream <stream name>
on table <tablename>
APPEND_ONLY True