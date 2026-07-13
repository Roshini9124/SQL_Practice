use EMS;

create table dep(
deptID int primary key,
deptName varchar(50) not null
);

create table emp(
empid int primary key,
empname varchar(50) not null,
age int check(age>=18),
	salary decimal(10,2) default 25000,
	joiningdate date,
	deptid int,
	foreign key (deptid)
	references dep(deptID)
	);


	insert into dep
	values
	(1,'IT'),
	(2,'HR'),
	(3,'FINANCE'),
	(4,'MARKETING'),
	(5,'SALES');

	insert into emp
	values
	--(001,'Joey',30,40030,'1999-09-10',5),
	(002,'Rachel',31,43000,'1999-09-10',4),
	(003,'Ross',32,40000,'1999-09-10',2),
	(004,'Monica',20,40500,'1999-09-10',5),
	(006,'Chandler',33,44000,'1999-09-10',1),
	(005,'Pheobe',22,40050,'1999-09-10',4);


	insert into emp(empid,empname,age,joiningdate,deptid)
	values
	(007,'Mike',27,'2003-09-08',5);

	select * from emp;


	create table emp_backup(
	id int primary key,
	name varchar(200),
	age int check(age>=18),
	salary decimal(10,2),
	jdate date,
	deptid int,
	foreign key (deptid)
	references dep(deptID));


	insert into emp_backup(id,name,age,salary,jdate,deptid)
	select * from emp;
	
	select * from emp_backup;

	select empname as Name ,salary as CTC from emp order by empname desc;
	insert into emp 
	values
	(8,'Joey',22,234556,'1999-02-12',2);

	select  empname from emp;--return with duplicate values
	select distinct empname from emp;--returns without duplicate values

	exec sp_help emp;

	alter table emp
	drop constraint CK__emp__age__5535A963;--to drop a constraint

	insert into emp
	values
	(11,'JAck',null,23231,'2004-09-22',1);

	select distinct age from emp;

	select * from emp
	where age between 27 and 30;

	select *  from emp
	where deptid in (1,2,5);

	--select * from emp
	--where empname =like 'J%';
	
	select * from emp
	where age is null;

	select * from emp 
	--order by salary asc; 
	--order by salary desc;
	 
	 update emp
	 set salary =salary+(salary*0.10);

	 update emp 
	 set salary=salary+5000
	 where salary<30000;

	 delete  from emp where empid=10;

	 delete from emp where deptid in (1,2);

	 select * from emp
	 order by empname
	 offset  2  rows ;

	 SELECT @@VERSION;