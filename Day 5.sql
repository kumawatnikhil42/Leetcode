select customer_number from orders 
group by customer_number 
having count(order_number) >= 
    (select max(order_count) from 
            (select count(order_number) as order_count from orders 
            group by customer_number) as order_counts);



select name,population,area from world
where area>=3000000 or population>=25000000



select class from courses 
group by class having count(class)>=5


# Write your MySQL query statement below
select name
from salesperson 
where name not in 
(select sp.name
from salesperson as sp
join orders as o on sp.sales_id=o.sales_id
join company as c on o.com_id=c.com_id
where c.name='Red');



select x,y,z,
case
    when x+y<=z then "No"
    when y+z<=x then "No"
    when x+z<=y then "No"
    else "Yes"
    end "triangle"
from triangle;


