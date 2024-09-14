select max(salary) as SecondHighestSalary
from Employee
where salary<(select max(salary) from Employee);



CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      select salary 
      from (select salary,dense_rank() over(order by salary desc) as r from Employee ) as emp
      where r=N limit 1 
  );
END



select score ,dense_rank() over(order by score desc) as "rank" from Scores
order by score desc;


select distinct(num) as ConsecutiveNums 
from (select num,lag(num) over(order by id) as p,
      lead(num) over(order by id) as n from Logs) as lg
where num=p and num=n;



# Write your MySQL query statement below
select d.name as Department,e.name as Employee,
e.salary as Salary
from Employee as e
join Department as d on e.departmentId=d.id
where (e.departmentId,e.salary) in (select departmentId,max(salary) from Employee group by departmentId);
