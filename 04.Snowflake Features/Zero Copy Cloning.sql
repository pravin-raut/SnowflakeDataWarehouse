USE DATABASE RETAIL;
USE SCHEMA STG;

/*
1. Clone Command
   Zero-Copy Cloning:
   - The CLONE command in Snowflake is a metadata operation that allows you to create a duplicate of an existing object (such as a table, schema, or database) without copying the underlying data physically. This operation is swift and cost-effective, as it only incurs additional storage costs when changes are made to the cloned object or the original object after the cloning operation.
   - The cloned object is completely independent, meaning changes to the original object or the cloned object do not affect each other after the clone has been created.
   - Storage management in Snowflake is robust, meaning that you only pay for the additional storage used by the clone if and when its data diverges from the original.
   - Cloning is particularly beneficial for testing and development environments, as it allows for the creation of accurate and isolated test data quickly. It can also be used in combination with Time Travel to clone objects as they existed at a specific point in the past.
   
   Applicability:
   - You can clone databases, schemas, and tables, including both permanent and transient objects.
   - Configuration objects like stages, file formats, and tasks can also be cloned.
   - Cloning a temporary table is restricted to creating another temporary table only.

   Syntax:
   - CREATE TABLE <new_table> CLONE <existing_table>;
     Optionally, you can specify a point in time (relative to the current time) to clone from:
   - CREATE TABLE <new_table> CLONE <existing_table> AT (OFFSET => -<minutes>*60);
     Here, <minutes> is the number of minutes back in time you wish to clone from.
*/

-- Clone the 'stg_payment' table to create 'stg_payment_clone'
CREATE TABLE stg_payment_clone CLONE stg_payment;

-- Clone the 'stg_payment' table from 10 minutes ago to create 'stg_payment_clone_new'
CREATE TABLE stg_payment_clone_new CLONE stg_payment AT (OFFSET => -10*60);
