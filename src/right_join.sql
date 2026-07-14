/*Task 2 ⭐⭐

Display:

Department Name
Location
Employee Name
Salary

using a RIGHT JOIN.*/


select d.depname,d.location,e.empname,e.salary
from employee e
right join department d
on d.departmentid=e.DepartmentID;


--Task 3 ⭐⭐⭐ (Important Interview Question)

--Find departments that do not have any employees.


select d.depname
from employee e
right join department d
on d.departmentid=e.DepartmentID

where e.empname is null;


select e.empname,d.depname
from employee e
full outer join department d
on e.departmentid=d.departmentid;
