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
--find second max salary 


select top 1 salary from employee where salary < 
(select max(salary) from employee)



with disp_cte as
(
select * from employee
)
select empname,city from disp_cte;

select * from disp_cte;



--corelated subquery

drop table if exists Employee;

CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Department VARCHAR(20),
    Salary INT
);

INSERT INTO Employee VALUES
(1,'Sheldon','Research',90000),
(2,'Leonard','Research',75000),
(3,'Howard','Engineering',70000),
(4,'Raj','Engineering',65000),
(5,'Penny','Sales',60000),
(6,'Bernadette','Sales',80000),
(7,'Amy','Research',95000),
(8,'Stuart','Sales',50000);

--Find employees whose salary is greater than the average salary of their own department.
select e.empname from employee e where e.salary>(
select avg(salary) from employee where department=e.department);

--Find employees who earn the highest salary in their own department.

select e.empname from employee e where e.salary=(
select max(salary) from employee where department=e.department);

--Find employees who earn the lowest salary in their own department.
select e.empname from employee e where e.salary=
(select min(salary) from employee where department=e.department);



--select empname,salary,avg(salary) over(partition by department) as avgsalary from employee;

create view display as
select * from employee


select * from display;