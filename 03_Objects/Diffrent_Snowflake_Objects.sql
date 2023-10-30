use database retail;
use schema stg;


/*
1. create table
    -Time travel retention period
    -Fail safe
2. create transient table
    -Time travel retention period(0-1) days
    -fail safe (NA)
    use
        - not needed data protection
3 Create temporary table
    -Time travel retention period
    -fail safe (NA)
    - Exist only in current session (0-1) days
*/

-- this can be applied for database and schema  and all of the table under schema will be same time

--for temp and permamnet table have no naming conflicts , if same table name is created on temp it will only show

create table original_table
(
id int
);
insert into original_table values (1);
create transient table transient_table
(
id int
);

create temporary table transient_table1
(
id int
);
select * from original_table;
create temporary table original_table
(
id int
);
select * from original_table;

show tables;



SNOWFLAKE_SAMPLE_DATA.INFORMATION_SCHEMA.APPLICABLE_ROLES