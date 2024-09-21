select u.user_id as buyer_id,
u.join_date,
count(o.item_id) as orders_in_2019
from Users as u
left join Orders as o on u.user_id=o.buyer_id and year(o.order_date)="2019"
group by u.user_id;



select distinct(product_id),new_price as price
from Products
where (product_id,change_date) in 
(select product_id,
max(change_date) 
from Products
where change_date <="2019-08-16"
group by product_id)
union
select distinct(product_id),
10
from Products
group by product_id
having min(change_date) >"2019-08-16"




select round(avg(immediate)*100,2) as immediate_percentage
from
(select case 
when  min(order_date)=min(customer_pref_delivery_date) then 1
else 0
end immediate
from Delivery 
group by customer_id) as sub;



select date_format(trans_date, '%Y-%m') as month,
country,
count(date_format(trans_date, '%Y-%m')) as trans_count,
count(if(state="approved",1,null)) as approved_count,
sum(amount) as trans_total_amount,
sum(if(state="approved",amount,0))as approved_total_amount
from Transactions
group by month , country;


select last as person_name
from
(select case
when (sum(weight) over(order by turn)) <=1000 then person_name
end last,
rank() over(order by turn desc) as r
from Queue) as d
where last is not null 
order by r
limit 1;
