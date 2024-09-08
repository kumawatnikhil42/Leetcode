select activity_date as day,count(distinct(user_id)) as active_users
from Activity
where datediff("2019-07-27",activity_date)<30
and activity_date<="2019-07-27"
group by activity_date




# Write your MySQL query statement below
select distinct(author_id) as id 
from Views
where author_id=viewer_id
order by id;




# Write your MySQL query statement below
select query_name,
round(avg(rating/position),2) as quality,
round((avg(rating<3))*100,2) as poor_query_percentage
from Queries
where query_name is not null
group by query_name;


select p.product_id,
ifnull(round(sum(p.price*u.units)/sum(u.units),2),0) as average_price
from Prices as p
left join UnitsSold as u on (p.product_id=u.product_id)
and u.purchase_date between p.start_date and p.end_date 
group by p.product_id;



select s.student_id,s.student_name,su.subject_name,count(e.subject_name) as attended_exams
from Students as s
join Subjects as su 
left join Examinations as e on (s.student_id=e.student_id) and su.subject_name=e.subject_name 
group by s.student_id,s.student_name,su.subject_name 
order by s.student_id,su.subject_name; 
