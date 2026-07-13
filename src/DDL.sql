use Student;

create table stud(
	StudentId INT PRIMARY KEY,
	Name varchar(50) not null,
	age int check(age>=18),
	email varchar(100) unique
	);

--adding new column
 alter table stud
 add phone varchar(15);

 --Modify StudentName to allow 100 characters.
 alter table stud
 alter column Name varchar(100) not null;

 --Drop the Phone column.

 alter table stud
 drop column phone;

 --Rename the table


 exec sp_rename
 'stud','Stud';


 alter table Stud
 add constraint df_age
 default 18 for age;
 

 truncate table Stud;

 select * from Stud;