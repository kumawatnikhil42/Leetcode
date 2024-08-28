select max(maxnum) as num 
from (select if(count(num)>1 , Null , num) as maxnum 
  from MyNumbers
  group by num) as nums;


select * from cinema
where id%2!=0 and description!="boring"
order by rating desc;

update Salary 
set sex = if(sex = "f","m","f")


group by actor_id,director_id
having count(*)>=3;


select p.product_name,s.year,s.price 
from Sales as s
join Product as p on (p.product_id=s.product_id)


select p.project_id ,round(avg(experience_years),2) as average_years
from Project as p 
join Employee as E on (e.employee_id=p.employee_id) 
group by p.project_id



select p.product_id,p.product_name 
from Product as p
join Sales as s on (p.product_id=s.product_id)
group by p.product_id
having min(s.sale_date) >= '2019-01-01' 
    and max(s.sale_date) <= '2019-03-31'; 


