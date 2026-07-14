drop table if exists employee;

CREATE TABLE Employee
(
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Department VARCHAR(30),
    Salary DECIMAL(10,2),
    Experience INT
);

INSERT INTO Employee VALUES
(101,'Alice','HR',35000,2),
(102,'Bob','IT',65000,6),
(103,'Charlie','IT',85000,10),
(104,'David','Sales',45000,4),
(105,'Eva','Finance',55000,7);

alter procedure CheckEmpSal
 @EmpId int
 as
 begin 
    declare 
     @Empname varchar(40),
        @Salary decimal(10,2);
    select 
            @Salary=Salary 
            
    from Employee
    where EmpId=@EmpId;

    if @Salary >50000
    begin 
        Select 
        @Empname as name,
         --@Salary as salary,
         'High slary' as status;
    end

    else
    begin   Select 
        -- @Empname as name,
        @Salary as salary,
         'Low slary' as status;
    end


end;

  exec CheckEmpSal 101;



  alter procedure GetEmp
  @id int
  as 
  begin
  declare 
    @name varchar(30),
    @sal decimal(10,2),
    @bonus decimal(10,2) ;
     
     set @bonus=5000;

  select @name=EmpName,
           @sal=Salary+@bonus
  from Employee
   where
   EmpId=@id;


   select @name as Name,@sal as Salary from employee where EmpId=@id;
   end;

exec GetEmp 104;


alter  procedure getexp
@id int
as
begin
 declare @salary decimal(10,2),
        @incentive int;

    set @incentive=5000
 select @salary=Salary + @incentive  from employee where EmpId=@id;
 

 select EmpName as Name,
    Experience ,
    @salary  as 'Annual Salary'
    from Employee 
    where EmpId=@id;
end;

exec getexp 101;


create procedure disp
@id int
as
begin 
    select EmpName as Name,
    Experience,Department,Salary
    from employee
    where EmpId=@id;
end;

exec disp 101;


alter procedure maxsal
as
begin
declare @maxsal decimal(10,2);
select @maxsal=max(Salary) from Employee;
select @maxsal as Maximum_Salary;
end;

exec maxsal;

drop procedure CheckEmpSal;

create procedure checksal
@id int
as
begin
declare 
@name varchar(20),
@sal decimal(10,2);

select @name=EmpName,@sal=Salary from Employee where EmpId=@id;
if @sal>=50000
begin 
   select @name as Name,@sal as Salary,   'High Salary' as status ;
end
else
begin 
   select @name as Name,@sal as Salary,  'Low Salary' as status  ;
end


end;
exec checksal 101;


