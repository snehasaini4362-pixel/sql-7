-- functions=> function is a block of code that we perform to specific task.
-- two type of function =user defined , predefined
-- predifined function=string,date,number
use sakila;
select * from customer;
-- upper
-- lower
select upper(first_name ) ,lower(first_name) from customer; -- captalize the string

-- length function count the bites=1character ,1 byte
select first_name,length(first_name ) from customer;
-- char lenth count the character
select first_name,char_length(first_name ) from customer;

-- concate=giving space every time
select concat("mrs",' ',first_name) from customer;

-- concate ws=giving space only one time and values are seprate automatic
select concat_ws('  ',first_name,last_name) from customer;

-- substring= substr
select first_name, email, substr(email,3) from customer;
-- positive indexing=1 and negetive start=-1
select first_name,last_name ,substr(first_name,-5) from customer;
-- kitne char chiye
-- substr(colum,starting char,character)
select first_name,last_name ,substr(first_name,2,3) from customer;
select first_name,last_name ,substr(first_name,3,3) from customer;

-- instr = character konse no. pe hai
select first_name,last_name ,instr(first_name,'a') from customer;
select email ,substr(email,1 ,instr(email,'@')-1 ) from customer;

-- replace 
select first_name ,replace(first_name,'A','@') from customer;

-- trim remove the white spaces
select "     sneha";
select char_length(trim("    sneha"));

-- padding=fixed number of characters
-- lpad,rpad
select first_name , lpad(first_name,6,'#') from customer;


-- date function
use sakila;
select * from customer;

-- yyyy-mm-dd
select current_date(); 
select current_time();
select curdate();
select current_timestamp();
select now();

select payment_id,payment_date,now() from payment;

-- adddate()=date add krta h
select payment_id,payment_date,now() , adddate(payment_date,1) from payment;

select payment_id,payment_date,now() , adddate(payment_date,-1) from payment;

-- interval = months,years,hours add krta hai,"-" se kam hota hai
select payment_id,payment_date,now() , adddate(payment_date,interval 2 month) from payment;
select payment_id,payment_date,now() , adddate(payment_date,interval 2 year) from payment;
select payment_id,payment_date,now() , adddate(payment_date,interval 2 hour) from payment;

-- datediff method date mein differance nikalta 
select payment_id,payment_date,datediff(now() , payment_date) from payment;

-- month()=month nikal k deta hai
select payment_id,payment_date, month(payment_date) from payment;

select payment_id,payment_date from payment where  month(payment_date) = 2;
select payment_id,payment_date from payment where  year(payment_date) = 2005;

-- extract method=year,hours,month ,quater
select extract(month from payment_date) from payment ;

-- date format()= string formate me data aata h

select  payment_date , date_format(payment_date,'current year is %y') from payment;





-- number function

-- round= value ko round off krke deta hai
select 28.68, round(28.68) ;  -- output 29
-- jab point k baad wali value 5 se badi hoti h tab 1 no. bda aata hai 
select 28.68, round(28.68) , round(28.68,1);

-- negetive se point se pehle wali value change hoti h

-- one place = tenth mein convert hogi
-- tenth = hundred
-- hundred =thousand
-- jo value - mein dalte h agr wo 5 se badi hoti h  tb badi value aati h 
select 23.68,round(127.68,-2);
select round(263.56,-2);

-- truncate= ye jo value dalte h waha tk similar value return krdeta hai
-- value ko extract krta hai
select round(14.685,2),truncate(14.685,2);

-- floor = floor point k baad wali value remove krdeta hai
select floor(5.99999);

-- ceil =uper value deta h
select ceil(6.787686875);

-- scaler function=function which applied on each row and return output for each row
-- string function
-- number function
-- date functions




 





