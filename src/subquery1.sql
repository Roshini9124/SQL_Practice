CREATE TABLE Employee
(
    EmpID INT,
    EmpName VARCHAR(50),
    Department VARCHAR(30),
    Salary INT,
    City VARCHAR(30)
);

INSERT INTO Employee VALUES
(1,'Ravi','IT',50000,'Chennai'),
(2,'John','HR',40000,'Bangalore'),
(3,'Sam','IT',6000,'Chennai'),
(4,'Priya','HR',45000,'Mumbai'),
(5,'David','Sales',30000,'Delhi'),
(6,'Alex','Sales',35000,'Delhi'),
(7,'Kiran','Finance',55000,'Mumbai'),
(8,'Meena','Finance',65000,'Chennai');


drop table if exists employee;


--Find employees who earn more than the average salary.

select empname from employee where salary >
(select avg(salary) 
from employee);

--Find the employee(s) who have the highest salary.
select empname from employee where salary =
(select max(salary) 
from employee);

--Find employees who earn the same salary as Ravi.

select  empname from employee where salary =

(select salary 
    from employee
    where empname='Ravi');
--Find employees who earn less than the average salary.

select empname from employee where salary <
(select avg(salary) 
from employee);

--Find employees who work in the same city as Meena.

select empname from employee where city =
(select city 
    from employee
    where empname='Meena');


--Find employees who work in departments where employees from Chennai work.
select empname from employee where department in
(select Department from employee where city='Chennai');

--Find employees who have the same department as John or David.
select empname from employee where department in 
(select department from employee where empname='John' or empname='David');

--Find employees whose salary is greater than any employee in Sales.

select empname from employee where salary>all
(select salary  from employee where department='Sales')

--Find employees who are NOT working in departments where salary is below 40000.
select empname from employee where department not in 
(select department from employee where salary<40000);

--Find employees whose department and salary match Ravi.
SELECT empname
FROM employee
WHERE department = 
      (SELECT department 
       FROM employee 
       WHERE empname='Ravi')
AND salary =
      (SELECT salary 
       FROM employee 
       WHERE empname='Ravi');


--Find departments whose average salary is above 40000.


select department from
(select department,avg(salary) as sal from employee group by department) as dep
where sal>40000;


select Department,avg(salary) from employee group by department having avg(salary)>40000;


--Display employee salary with company average salary.

select empname from employee where salary=
(select avg(salary) from employee);


insert into employee
values
(9,'Joey','HR',47500,'Queens');
--find second max


select top 1 salary from employee where salary < 
(select max(salary) from employee)
