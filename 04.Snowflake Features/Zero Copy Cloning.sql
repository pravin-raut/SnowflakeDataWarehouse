USE DATABASE RETAIL;
USE SCHEMA STG;


/*
1. Clone Command 
Zero copy cloning 
    metadata operation , referencing old storage
    only additional cost 
    clone table is completely independnet object
    storage managerment is strong we neeed to give additional pay

    for testing it benifieicla it works with trime travel

Database schemas and tables cna be cloned only permamanet and transietn 

also configuration objects like stages file formats and tasks


create table <new> clone <old>
--optional BEFORE(TIMESTAMP =><Timestamp>)

    Temporary table can be clone to another temporary table
*/


create table stg_payment_clone clone stg_payment

create table stg_payment_clone_new clone stg_payment at (offset => -60*10)

