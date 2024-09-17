select case
when id%2=0 then id-1
when id%2=1 and id= (select max(id) from Seat) then id
else id+1 
end as id,
student
from Seat 
order by id; 


select customer_id
from Customer 
group by customer_id
having count(distinct(product_key)) = (select count(distinct (product_key)) from Product);


select product_id,year as first_year,quantity,price
from Sales 
where (product_id,year) in (select product_id,min(year) from Sales group by product_id);
