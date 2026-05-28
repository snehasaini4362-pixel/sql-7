-- tcl => transaction control language
-- transaction are the group of sql statements  which work as a unit to manage all transaction like 
-- this tcl command insure my data is correct by following the four property
-- automacity(my all the transaction completety done or undone)
-- consistency(data mera correct way mein ja ra hai by checking 
-- isolation=>
-- durablility=>jo bhi 

create database rajdb;
use rajdb;
create table raj45(id int);
insert into raj45 values(10);
select * from raj45;

start transaction;
insert into raj45 values(100),(99);
select * from raj45;
commit; -- save button


-- transaction ko start krne k liye start transaction likhna padta hai
-- when the transactionn end .....commit...rollback....ddl statement chalao

start transaction;
update raj45 set id=500;
select * from raj45;
rollback; -- pending transaction ko revert/undo krdeta hai 

-- bina start transaction ke permanent delete ,update ho jata hai ....fir rollback wagarh kaam nhi  aate 

start transaction;
insert into raj45 values(10),(11),(56),(77);
delete from raj45 where id=10;
select * from raj45;
commit; 
rollback;-- commit krne se rollback nhi chlta


start transaction;
insert into raj45 values(444),(758),(400);
savepoint raj45_savepoint_ins;

 update  raj45 set id=1000;
select * from raj45;
rollback to raj45_savepoint_ins; -- rollback to savepoint to revert upto specific point

create table tr(id int);




-- drop or truncate dono ddl statement h
-- delete dml statement h
-- truncate and drop k sath rollback use nhi hota 




