select emp2.name as Employee from employee as emp 
join employee as emp2 
where emp.id=emp2.managerId and emp.salary<emp2.salary ;

select  email as Email from person
group by  email having count(email)>=2

select name as "Customers" from customers as c left join orders as o
on (c.id=o.customerId) where o.customerId is Null ;

delete p1 from person as p1 join person as p2
where p1.email = p2.email and p1.id>p2.id;

select w1.id from weather as w1
join weather as w2 
where datediff(w1.recordDate,w2.recordDate)=1 and w1.temperature > w2.temperature ;
