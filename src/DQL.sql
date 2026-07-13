


 CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Gender VARCHAR(10),
    Age INT,
    Department VARCHAR(30),
    City VARCHAR(30),
    Salary DECIMAL(10,2),
    Experience INT
);
INSERT INTO Employees VALUES
(101,'Alice','Female',25,'HR','Chennai',35000,2),
(102,'Bob','Male',30,'IT','Bangalore',50000,5),
(103,'Charlie','Male',28,'IT','Chennai',60000,4),
(104,'David','Male',35,'Finance','Hyderabad',70000,8),
(105,'Eva','Female',29,'HR','Bangalore',45000,4),
(106,'Frank','Male',40,'Finance','Hyderabad',80000,12),
(107,'Grace','Female',32,'IT','Chennai',55000,7),
(108,'Helen','Female',26,'Sales','Mumbai',30000,2),
(109,'Ian','Male',31,'Sales','Mumbai',65000,6),
(110,'Jack','Male',27,'HR','Chennai',40000,3),
(111,'Kevin','Male',45,'Finance','Hyderabad',90000,18),
(112,'Lily','Female',24,'Sales','Bangalore',38000,1),
(113,'Mona','Female',36,'IT','Chennai',72000,10),
(114,'Nina','Female',33,'HR','Mumbai',58000,9),
(115,'Oscar','Male',38,'Sales','Bangalore',62000,11);

select avg (age) from employees where gender='Female';
select count(empname) as no_of_employee, department from employees group by department;
select avg(salary),city from employees group by city;
select max(experience),city from employees group by city;

select count(empid),department from employees group by department having count(empid)>3;

select department,count(empid),SUM(salary),avg(salary) from employees group by department having count(empid)>3 and avg(salary)>50000;


select * into emp_backup from employees;
select * from emp_backup;


select max(salary),department from employees  where gender='male' group by department ;