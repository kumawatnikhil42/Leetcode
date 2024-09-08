select user_id,
concat(upper(substr(name,1,1)),lower(substr(name,2,length(name)-1))) as name
from Users
order by user_id ;



select tweet_id from Tweets 
where LENGTH(content)>15;


select date_id,make_name,
count(distinct(lead_id)) as unique_leads,
count(distinct(partner_id)) as unique_partners
from DailySales
group by date_id,make_name;



select user_id,
count(distinct(follower_id)) as followers_count
from Followers
group by user_id
order by user_id;



count(r.reports_to) as reports_count,
round(avg(r.age)) as average_age
from Employees as e
join Employees as r on e.employee_id=r.reports_to
group by e.employee_id,e.name
order by e.employee_id
