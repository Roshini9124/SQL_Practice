CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    Location VARCHAR(50)
);

drop table if exists Department;

exec sp_rename 'Department.DepartmentName' ,'DepName','COLUMN';
drop table if exists Employee;

INSERT INTO Department VALUES
(101,'HR','Chennai'),
(102,'IT','Bangalore'),
(103,'Sales','Mumbai'),
(104,'Finance','Delhi'),
(105,'Marketing','Hyderabad');

CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Salary INT,
    DepartmentID INT
);

INSERT INTO Employee VALUES
(1,'Alice',45000,101),
(2,'Bob',55000,102),
(3,'Charlie',60000,103),
(4,'David',50000,102),
(5,'Eva',48000,106),     -- Department doesn't exist
(6,'Frank',70000,NULL);  -- No department assigned


/*Task 1 ⭐ (Very Easy)

Display:

Employee Name
Department Name

using a LEFT JOIN.

Expected Concept:

Show all employees, even if they don't have a matching department.*/

select e.empname,e.salary,d.depname ,d.location
from employee e
left join department d
on e.DepartmentID=d.departmentid;


--Find employees who do not belong to any department.

select e.empname 
from employee e 
left join department d
on e.departmentid=d.departmentid
where d.departmentid is null;

--Task 5 ⭐⭐⭐

--Display all employees whose department is IT.

--If an employee has no department, do not display them.


select e.empname 
from employee e
left join department d
on e.DepartmentID=d.departmentid
where d.depname='IT';


/*Task 6 ⭐⭐⭐⭐ (Important Interview Question)

Display:

Department Name
Employee Name

Return all departments, even if there are no employees in them.*/

select d.depname,e.empname
from department d
left join employee e
on d.departmentid=e.DepartmentID
