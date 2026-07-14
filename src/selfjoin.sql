CREATE TABLE persons (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    ManagerID INT
);

INSERT INTO persons VALUES
(1, 'John', NULL),
(2, 'David', 1),
(3, 'Sarah', 1),
(4, 'Mike', 2),
(5, 'Emma', 2);

SELECT * 
FROM persons;


select e.empname,m.empname
from persons e
left join persons m
on e.managerid=m.empid;

  

