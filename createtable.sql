create database const_db;

use const_db;

select database();

-- ddl (data defination lanuage) create
create table if not exists test1(id int,age int);
-- dml (data manipulation language) insert
insert into test1 values(101,32),(102,null);
select * from test1;

-- constraints= constraints are the rule to table columns to privent invalid in data entry
-- sql constraints are used to specify rules for data in a table.

-- not null contraints
-- columns connot have a null value(col1 int not null )
create table if not exists test2(id int,age int not null);
insert into test1 values(101,32),(102,null);
select * from test1;

-- unique constraints
-- all values in columns are different(col2 int unique)
create table if not exists test3(id int unique,age int not null);
insert into test3 values(101,32);
select * from test3;
insert into test3 values(102,32);
insert into test3 values(null,40);
select * from test3;

-- ek column mein vlaue rakhna 
create table if not exists test5(id int ,age int );
insert into test5(age) values(101);
select * from test5;

-- default contraints
-- sets the default value of a columns
create table if not exists test6(id int default 100,age int );
insert into test6(age) values(101);
select * from test6;

-- primary key
-- makes a column unique & not null burt used only for once.
create table if not exists test7(id int primary key ,age int );
insert into test7 values(101,82);
insert into test7 values(null,27); -- primmary key null nhi ho sakti
select * from test7;

create table if not exists test8( id int,age int , salary int);
insert into test8 values(1,50,500000),(2,40,20000),(1,51,400000),(3,50,1000);
select * from test8;
desc test8;

-- check contraints=it can limit the values allowed in a column.
create table if not exists test9( id int,age int check(age>10));
-- between operator
create table if not exists test9( id int,age int check(age between 18 and 22));

insert into test9 values(1,50);
insert into test9 values(1,10); -- error
select * from test9;

-- foreign key
create table student(id int,name varchar(20),cname varchar(20));
insert into student values(1,'naina','10'),(2,'abhi','12');
-- parent table
create table s_class (cname varchar(20)primary key);
insert into s_class values(10),(8),(9);
select * from s_class;

-- child table
create table studentss(id int,name varchar(20),cname varchar(20),
foreign key(cname) references s_class(cname));
insert into studentss values(1,'naina','10');
insert into studentss values(2,'abhi','20'); -- will give me error

select * from studentss;








-- datatypes 


create database if not exists datatypedb;

use datatypedb;

-- numeric
create table test1(id tinyint);
insert into test1 values(-1),(10);
insert into test1 values(-129);-- out of range (1byte=>8bit =>2**8(-128 to 127)
select * from test1;

-- small int->2 byte medium int->3 byte
-- int ->4
-- big int ->8byte


create table test2(age tinyint unsigned);
insert into test2 values(250);
select * from test2;

-- float and double data type
create table test3(salary float,salary2 double);
insert into test3 values(1989.9302934,1989.9301934);
select * from test3;

create table test4(price double(6,2));  -- total is 6,2 is decimal value,4 are the vslue before
insert into test4 values(0.7945839);-- only 2 decimal value
insert into test4 values(44.7849038);
insert into test4 values(4453.7945839);
insert into test4 values(4453);
insert into test4 values(44531);-- 5 integer value
select * from test4;


-- string databse
-- char,varchar
create table test5(countrycode char(3));
insert into test5 values('ind');
insert into test5 values('india');-- <<---- error
insert into test5 values('he               ');
select *, char_length(countrycode) from test5;

-- char jitni memory dete h utni puri leta hai or space ko cover nhi krta hai
create table test6(countrycode varchar(3));
insert into test5 values('ind');
insert into test5 values('india');-- <<---- error
insert into test5 values('h               ');
select *, char_length(countrycode) from test5;









