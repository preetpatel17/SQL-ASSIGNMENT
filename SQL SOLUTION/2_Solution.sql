-----------------------------------------
-- Build the Schema
-----------------------------------------
create database if not exists employeedb;
use employeedb;

CREATE TABLE Departments (
  Code INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  Budget decimal NOT NULL 
);

CREATE TABLE Employees (
  SSN INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  LastName varchar(255) NOT NULL ,
  Department INTEGER NOT NULL , 
  foreign key (department) references Departments(Code) 
);

INSERT INTO Departments(Code,Name,Budget) VALUES(14,'IT',65000);
INSERT INTO Departments(Code,Name,Budget) VALUES(37,'Accounting',15000);
INSERT INTO Departments(Code,Name,Budget) VALUES(59,'Human Resources',240000);
INSERT INTO Departments(Code,Name,Budget) VALUES(77,'Research',55000);

INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('123234877','Michael','Rogers',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('152934485','Anand','Manikutty',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('222364883','Carol','Smith',37);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('326587417','Joe','Stevens',37);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('332154719','Mary-Anne','Foster',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('332569843','George','ODonnell',77);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('546523478','John','Doe',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('631231482','David','Smith',77);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('654873219','Zacary','Efron',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('745685214','Eric','Goldsmith',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('845657245','Elizabeth','Doe',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('845657246','Kumar','Swamy',14);

select * from departments;
select * from employees;

#1
select lastname from employees;

#2
select distinct lastname from employees;

#3
select * from employees where lastname = 'smith';

#4
select * from employees where lastname in ('smith', 'doe');

#5
select * from employees where department = 14;

#6
select * from employees where department in (37,77);

#7
select * from employees where lastname like 's%';

#8
select code ,sum(budget) as Total from departments group by code;

#9
select  department,count(*) as NO_OF_EMP from employees group by department; 

#10
select SSN, e.Name, e.lastname, e.department, d.name, d.budget 
from employees e left join departments d 
	on e.department = d.code 
group by ssn;

#11
select e.name, e.lastname, d.name, d.budget 
from employees e join departments d 
    on e.department = d.code;
    
#12
select e.name, e.lastname, d.budget 
from employees e join departments d 
    on e.department = d.code
    where d.budget  > 60000;
    
#13
select * from departments;
select name, budget from departments where budget > (select avg(budget) from departments);

#14
select d.name,count(*) 
	from employees e join departments d
		on e.department = d.code
        group by d.name 
        having count(*) > 2;
 
#15 
select e.name, e.lastname, budget 
	from employees e join departments d
		on  e.department = d.code 
        where budget = (select min(budget) from departments where Budget not in (select min(budget) from departments)
);
select * from departments order by budget;
select min(budget) from departments where Budget not in (select min(budget) from departments);

#16
insert into departments(code, name, budget) values (11, 'Quality Assurance', 40000);
insert into employees(ssn, name, lastname, department) values (847219811, 'Mary', 'Moore', 11) ;

#17
UPDATE Departments SET Budget = Budget * 0.9;

#18
update Employees set department = 14 where department = 77;

#19
delete from employees where department = 14;

#20
delete from employees where department in (select code from departments where budget >= 60000);

#21
delete from employees;
