with highs as (select d.name as Department,
e.name as Employee,
salary,
dense_rank() over(partition by departmentId order by salary desc) as highr
from Employee as e
join Department as d on d.id=e.departmentId)
select Department,Employee,salary as Salary
from highs where highr<=3;



select t.request_at as "Day",
round(count(if(status="completed",null,1))/count(status),2) as "Cancellation Rate"
from Trips as t 
join Users as u on u.users_id=t.client_id
join Users as k on k.users_id=t.driver_id
where k.banned!="Yes" and u.banned!="Yes" and request_at between "2013-10-01" and "2013-10-03"
group by request_at;



with cid as (select *, id-row_number()over(order by id asc) as rn
from stadium
where people >= 100)
select id,visit_date,people
from cid where rn 
in (select rn from cid group by rn having count(rn)>=3)
order by visit_date;


