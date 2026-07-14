CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    DepartmentID INT
);

INSERT INTO Employee VALUES
(1, 'Alice', 101),
(2, 'Bob', 102),
(3, 'Charlie', 103);

CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

INSERT INTO Department VALUES
(101, 'HR'),
(102, 'IT'),
(103, 'Sales');



--drop table if exists employee;


select e.empname,d.departmentname
from employee e
inner join Department d
on e.departmentid=d.DepartmentID;

select * from department
select * from employee

-----------------------------


CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);

INSERT INTO Customers VALUES
(1, 'John'),
(2, 'Alice'),
(3, 'David');

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    SalesmanID INT
);

INSERT INTO Orders VALUES
(101, 1, 201),
(102, 2, 202),
(103, 1, 203),
(104, 3, 202);


CREATE TABLE Salesman (
    SalesmanID INT PRIMARY KEY,
    SalesmanName VARCHAR(50)
);

INSERT INTO Salesman VALUES
(201, 'James'),
(202, 'Maria'),
(203, 'Robert');



select
   c.customername,
   o.orderid,
   s.salesmanname
from
customers c
inner join
orders o 
on c.customerid=o.customerid
inner join
salesman s on o.salesmanid=s.salesmanid;
