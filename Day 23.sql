select round((select count(distinct(a1.player_id))
             from Activity as a1
             join (select player_id,min(event_date) as first 
                   from Activity  
                   group by player_id) as a2
             on datediff(a1.event_date,a2.first)=1
             and a1.player_id=a2.player_id)
/(select count(distinct(player_id)) from Activity),2) as fraction;




select name 
from Employee 
where id 
in (select managerID 
    from Employee group by managerId having count(*)>=5);



select round(sum(tiv_2016),2) as tiv_2016
from Insurance
where tiv_2015 in (select tiv_2015 from Insurance group by tiv_2015 having count(tiv_2015)>1)
and concat(lat,lon) not in (select concat(lat,lon) from Insurance group by lat,lon having count(concat(lat,lon))>1);


with rall as(select requester_id, accepter_id
from RequestAccepted
union all
select  accepter_id,requester_id
from RequestAccepted)
select requester_id as id,count(accepter_id) as num
from rall
group by requester_id
order by num desc
limit 1;


select id,case
when p_id is null then "Root"
when id in (select p_id from Tree) then "Inner"
else "Leaf" 
end type
from Tree; 



