-- mysql pr kitne user hai sare show honge 
select * from mysql.user;

-- new user bnnanaa 
create user ishan identified by '123';

select current_user();
create database testdb4;
use testdb4;
create table emp(id int ,name varchar(20));
insert into emp values(20,'abhi'),(21,'naina');
select * from emp;


show grants for ishan;
grant select on testdb4.emp to ishan;

grant delete on testdb4.* to ishan;



-- change password
alter user 'ishan'@'%' identified by'12345678910';
select user ,host from mysql.user;


-- also create one more table selelct error delete chal jayegi
-- revoke this dwlte privlage from  the ishan user
-- give select and isert privlage to a perticular table 
-- create a databse with 3 column and isert 2 rows
-- now give 1 column acess to this select statement also give the update privalage 2 or 3 columns
-- rem0ve all the privalg3e the ishan user
create user radhika identified by 'radha123';
 
create database mine;
use mine;
create table snehaa(id int ,name varchar(20),contact int);
insert into snehaa values(1,'vishal',99897),(2,'sakshi',34567);
select * from snehaa;

show grants for radhika;
grant delete on snehaa to radhika;
select * from snehaa;
delete from snehaa where id=1;
revoke delete on snehaa from radhika;
grant select,insert on snehaa to radhika;
grant select(name) on snehaa to radhika;
grant update(name,contact)on snehaa to radhika;
revoke all privileges, grant option from radhika;





-- create three users and  create a group sales select ,insert and update
-- 2 user ko add krdo group pe 
-- login to these user ...permissin h ya nhi 

CREATE USER radhi IDENTIFIED BY 'rad123';

CREATE USER ishann IDENTIFIED BY 'ish123';

CREATE USER nikita IDENTIFIED BY 'nik123';
create database testdb5;
use testdb5;
create table employee(id int ,name varchar(20));
insert into employee values(20,'abhi'),(21,'naina');
select * from employee;

CREATE ROLE sales;

GRANT SELECT, INSERT, UPDATE
ON employee
TO sales;


GRANT sales TO radhika;

GRANT sales TO ishan;


