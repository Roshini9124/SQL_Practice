CREATE TABLE Bank (
    AccountNo INT PRIMARY KEY,
    HolderName VARCHAR(30),
    Balance DECIMAL(10,2)
);

INSERT INTO Bank VALUES
(101, 'Alice', 10000),
(102, 'Bob', 8000),
(103, 'Charlie', 15000),
(104, 'David', 5000);

begin transaction

    update bank
    set balance=balance+5000
    where holdername='Alice';

    update bank
    set balance=balance+3000
    where holdername='Bob';

commit;

select * from bank;



begin transaction

delete from bank where AccountNo=104;

update bank
set balance=48000;

rollback;



begin transaction

update bank
set balance=balance+2000
where holdername='Alice';

save transaction s1;

update bank
set balance=balance+4000
where holdername='Bob';


delete  from bank where holdername='Charlie';

rollback transaction  s1

commit;


BEGIN TRANSACTION

UPDATE Employee
SET Salary = Salary + 1000
WHERE EmpID = 101;

SAVE TRANSACTION A;

UPDATE Employee
SET Salary = Salary + 2000
WHERE EmpID = 102;

SAVE TRANSACTION B;

DELETE FROM Employee
WHERE EmpID = 104;

ROLLBACK TRANSACTION B;

UPDATE Employee
SET Salary = Salary + 500
WHERE EmpID = 104;

COMMIT;


BEGIN TRANSACTION;

UPDATE Bank
SET Balance = Balance - 1000
WHERE AccountNo = 101;

SAVE TRANSACTION S1;

UPDATE Bank
SET Balance = Balance + 1000
WHERE AccountNo = 102;

SAVE TRANSACTION S2;

UPDATE Bank
SET Balance = Balance - 500
WHERE AccountNo = 104;

ROLLBACK TRANSACTION S2;

COMMIT;

select * from bank;