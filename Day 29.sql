(select u.name as results
from Users as u
join MovieRating as mr on u.user_id=mr.user_id
group by mr.user_id
order by count(*) desc,u.name asc
limit 1)
union all
(select m.title as results
from Movies as m
join MovieRating as mr on m.movie_id=mr.movie_id
where month(mr.created_at)=2 and year(created_at)=2020
group by mr.movie_id
order by avg(mr.rating) desc,m.title asc
limit 1)



with tgl as (select stock_name,
if(operation="Buy",price,0) as tbuy,
if(operation="Sell",price,0) as tsell 
from Stocks)
select stock_name,
(sum(tsell)-sum(tbuy)) as capital_gain_loss
from tgl
group by stock_name;



(select "Low Salary" as Category,count( case 
when income<20000 then 1 else null end) as accounts_count
from Accounts)
union
(select "Average Salary" as Category,count( case 
when income between 20000 and 50000 then 1 else null end) as accounts_count
from Accounts)
union 
(select "High Salary" as Category,count(case 
when income>50000 then 1 else null end) as accounts_count
from Accounts)



select s.user_id,
round(avg(case
when action="confirmed" then 1
else 0
end 
),2) as confirmation_rate 
from Signups as s
left join Confirmations as c on c.user_id=s.user_id
group by s.user_id;



select transaction_date,
sum(if(amount%2!=0,amount,0)) as odd_sum,
sum(if(amount%2=0,amount,0)) as even_sum 
from transactions
group by transaction_date
order by transaction_date;






