use database retail;
use schema stg;

COPY INTO stg_Payment (PaymentMethod,PaymentId)
FROM (
    SELECT s.$1, s.$2
    FROM @my_external_stage/payment/ s
)
FILE_FORMAT = (FORMAT_NAME = csv_format)



select * from stg_Payment

update stg_Payment
set paymentmethod='Cash'

-- enterprise edition we can travel 90 days
--Method1
select * from stg_Payment at( OFFSET => -60*60)

--Method2

select * from stg_Payment before (timestamp => '2023-10-28 22:00:00'::timestamp)

--method 3( Query id of update)
select * from stg_payment before (statement => '01aff738-0000-2a08-0000-5de90001010a')



-- Bad practice
--to create table again with create or replace table
truncate table stg_payment
insert into stg_payment
select * from stg_payment before (statement => '01aff738-0000-2a08-0000-5de90001010a')

drop table stg_payment

undrop table stg_payment

-- we can drop and undrop schema and databases

--even if we do create or replace we can first alter the table with new name and execute undrop table 

/*
--Retention time

Standard edition -1 day
Enterprise -90 days
business critical -90 days
virtual privcate -90 dayas

*/
--default retention is 1 day
show tables like'stg_payment'

-- ALter table
Alter table stg_payment set DATA_RETENTION_TIME_IN_DAYS=2
--if we set to 0 we cannot undrop

CREATE or replace TABLE stg_Payment (
    PaymentId INT,
    PaymentMethod VARCHAR(50)
)
DATA_RETENTION
;


/*
Time Travel cost


*/

select * from snowflake.account_usage.storage_usage 

select * from snowflake.account_usage.table_storage_metrics



/*
Understanding Fail Safe
1. Protection of historical data in case of disaster
2. NOn configuratble 7 days period for permamnet tables
3. period start after time travel period has ended
4. Recoverable only by snowflake
5. Contribute to storage coset
*/