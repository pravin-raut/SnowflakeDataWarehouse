use database retail;
use schema stg;

create or replace table customers
(

customer_id int autoincrement start=1 ,increment=1,
first_name varchar(40) default 'Pravin',
create_timestamp timestamp
);

create or replace table customers2
(

customer_id int autoincrement start=1 ,increment=1,
first_name varchar(40) default 'akshata',
create_timestamp timestamp
);
create or replace table customers3
(

customer_id int autoincrement start=1 ,increment=1,
first_name varchar(40) default 'akshata',
create_timestamp timestamp
);

create table  process
(
id int
);
insert into process values (1)

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



create or replace task cusomter_insert_new
warehouse=compute_wh
schedule='using CRON 6-8 21 * * 1-5 UTC'
show tasks;

Alter task customer_insert resume;
Alter task customer_insert suspend;


select * from customers

Alter task customer_insert2 resume;
Alter task customer_insert2 suspend;

create or replace task customer_insert2
warehouse=compute_wh
After customer_insert
as
INSERT INTO customers2 select * from customers

create or replace task customer_insert3
warehouse=compute_wh
After customer_insert,customer_insert2
as
INSERT INTO customers3 select * from customers2


-- 1 parent task
-- Nested task can be upto 100
-- 1 parent can have upto 1000 child

show tasks
select * from customers2
