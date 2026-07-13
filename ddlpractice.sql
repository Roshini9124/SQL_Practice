use EMS;

create table dept(
DeptID int ,
DeptName varchar(20) not null
);

alter table dept
ALTER COLUMN DeptId int not null;

alter table dept 
add constraint pk_deptid
primary key(DeptId);

create table Empl(
empid int primary key,
name varchar(40) not null,
age int check (age>=18),
salary decimal(10,2) default 20000,
deptid int,
foreign key (deptid)
references dept(DeptId)
);

alter table Empl
add  Email varchar(50) unique;

alter table Empl
alter column   Email varchar(150) ;

alter table Empl
alter column age int check(age>=21);
--ALTER TABLE Empl
--DROP CONSTRAINT CK__Empl__age;

--ALTER TABLE Empl
--ADD CONSTRAINT CK_Empl_Age
--CHECK(age >= 21);
exec sp_rename 'Empl','Empl';

truncate table Empl;

drop table Empl;

drop table dept;