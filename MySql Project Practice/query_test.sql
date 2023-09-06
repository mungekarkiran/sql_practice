show databases;
use project_practice;
show tables;
select * from student_details;
create database bank_project;
use bank_project;
show tables;
-- drop table user_table;
-- drop table customer_details_table;
-- drop table transactions_table;

select * from user_table;
select * from customer_details_table;
select * from transactions_table;


select 
	cd.account_no, 
	substr(cd.account_no, -4, 4) as last_four_char, 
    cd.account_balance, 
    u.user_password 
from customer_details_table cd
join user_table u
	on cd.account_name = u.user_name
where cd.account_name = 'kiran';




-- 8b575cf0-3567-4ac2-8199-7808c9ee0f72
-- kiran

select account_balance 
from customer_details_table
where account_no = '8b575cf0-3567-4ac2-8199-7808c9ee0f72' and account_name = 'kiran';


update account_balance 
set customer_details_table = ()
where account_no = '8b575cf0-3567-4ac2-8199-7808c9ee0f72' and account_name = 'kiran';


select * from customer_details_table;
select * from transactions_table;

select 
	cd.account_no, 
    cd.account_name, 
    cd.phone_no, 
    cd.address, 
    cd.account_balance, 
    tt.transaction_date as account_created_date
from customer_details_table cd
join (
		select account_no, transaction_date 
		from transactions_table
		order by transaction_date)  tt
	on tt.account_no = cd.account_no
where cd.account_name = 'kiran'
limit 1
;

select account_no, transaction_date 
from transactions_table 
-- where account_name = 'kiran'
order by transaction_date 
-- limit 1
;

select * from customer_details_table;
select * from transactions_table;



select 
	tt.transaction_date, 
    tt.withdrawal_amount, 
    tt.deposit_amount, 
    tt.balance_amount
from transactions_table tt
where tt.account_no = (
	select cd.account_no
	from customer_details_table cd 
	where cd.account_name = 'kiran'
);


select * from user_table;
select * from customer_details_table;
select * from transactions_table;

delete from user_table where user_name ='';

delete from transactions_table where account_no = (
select cd.account_no
from customer_details_table cd 
where cd.account_name = 'kiran'
);

delete from customer_details_table where account_no = (
select cd.account_no
from customer_details_table cd 
where cd.account_name = 'kiran'
);
