select employee_id,
if(employee_id%2=0 or name like  "M%",0,salary) as bonus
from Employees
order by employee_id;



(select e.employee_id
from Employees as e
left join Salaries as s on e.employee_id = s.employee_id
where s.salary is null
union
select s.employee_id
from Employees as e
right join Salaries as s on e.employee_id = s.employee_id
where e.name is null)
order by employee_id;




select employee_id 
from Employees 
where manager_id 
not in (select employee_id from employees) 
and salary<30000
order by employee_id; 




select teacher_id,
count(distinct(subject_id)) as cnt
from Teacher
group by teacher_id;
