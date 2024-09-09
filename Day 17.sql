select event_day as day, 
emp_id,
sum(out_time-in_time) as total_time
from Employees
group by emp_id,event_day;



select product_id
from Products
where low_fats="Y" and recyclable="Y";


select employee_id,
department_id 
from Employee
where primary_flag="Y" 
or employee_id not in (select employee_id from Employee where primary_flag="Y") 
group by employee_id;


select product_id,'store1' as store,
store1 as price
from Products
where store1 is not null
union
select product_id,'store2' as store,
store2 as price
from Products
where store2 is not null
union
select product_id,'store3' as store,
store3 as price
from Products
where store3 is not null;



select user_id,max(time_stamp) as last_stamp
from Logins where year(time_stamp)=2020
group by user_id;
