use database retail;
use schema stg;


select * from stg_store


create table stg_store_prod
clone  stg_store

select * from stg_store_prod where storeid=1


alter table stg_store_prod
swap with  stg_store
