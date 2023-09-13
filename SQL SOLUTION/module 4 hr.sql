use hrdb;

select * from employees, departments;

select hire_date, first_name from employees;

select concat(first_name, last_name, ',', ' ',job_id) from employees;

select hire_date, concat(first_name, ' ', last_name) as name ,department_id from employees where job_id like('%clerk%');

#5
select concat(employee_id,',',first_name,',',last_name,',',email,',',phone_number,',',hire_date,',',job_id,',',salary,',',commission_pct,',',manager_id,',',department_id) as 'THE OUTPUT' from employees;

#6
select first_name, salary from employees where salary > 2000;

#7
select concat(first_name, ',', last_name) as Name ,hire_date as 'Start Date' from employees;

#8
select concat(first_name, ',', last_name) as Name ,hire_date from employees order by hire_date;

#9
select concat(first_name, ',', last_name) as Name ,salary from employees order by salary desc;

#10
select concat(first_name, ',', last_name) as Name, department_id, commission_pct from employees where commission_pct > 0 order by salary desc;

#11
select last_name, job_id from employees where manager_id is null;

#12
select last_name, job_id, salary from employees where job_id in ('sa_rep','sh_clerk') and salary not in (2500.00,3500.00,5000.00);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------

#1
select max(salary), min(salary), avg(salary), min(commission_pct), max(commission_pct), avg(commission_pct) from employees;

#2
select department_id, sum(salary) as 'Total Salary Payout', sum(commission_pct)*salary as 'Total Commission Payout' from employees group by department_id;

#3
select department_id, count(department_id) as 'Number of Employees' from employees group by department_id;

#4
select department_id, sum(salary) as 'Total Salary' from employees group by department_id;

#5
select concat(first_name,' ',last_name) as 'name', commission_pct from employees where commission_pct is null order by 1;

#6
select concat(first_name,' ',last_name) as 'name', department_id, commission_pct ,
	case 
		when
			commission_pct is null then 'No Commission'
		else 
			'Commission'
		end as 'Commission Status'
from employees;

#7
select concat(first_name,' ',last_name) as 'name', department_id, (commission_pct*2) as commission_pct ,
	case 
		when
			commission_pct is null then 'No Commission'
		else 
			'Commission'
		end as 'Commission Status'
from employees;

#8
select count(first_name),first_name,department_id 
from employees group by first_name , department_id 
having count(*) > 1;

#9
select sum(salary), manager_id from employees group by manager_id;

#10
select department_id, count(employee_id) as number_of_employees from employees group by department_id;

#11
select concat(first_name,' ',last_name) as 'name', department_id, salary from employees 
where last_name like '_a%' ;

desc departments;
desc employees;
	
#12
select avg(salary), department_id from employees group by department_id order by department_id;

#13
select department_id, max(salary) from employees group by department_id;

#14
select commission_pct,salary,
 case when 
			commission_pct is not null then (salary)*(10/100) 
	  when 
			commission_pct is null then 1
	end as 
			'commssion status'
from employees;

-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------

#1
select substring(last_name, 2, 4) as modified,
	   concat(upper(substring(last_name, 2, 1)), substring(last_name, 3, 3)) as formatted from employees;
        
#2
select concat(first_name,'-',last_name) as updated_name, month(hire_date) from employees;

#3
select last_name,salary,
case 
	when (salary/2) > 10000 then (salary)+((salary)*(10/100)) 
    when (salary/2) < 10000 then (salary)+((salary)*(11.5/100))+(1500)
    end as edited_salary
from employees;

#4
select department_id, salary, 
	   concat(substring(employee_id,1,2),'00',substring(employee_id,3),'E') as formatted_id 
from employees;

#5
select concat(upper(substring(last_name,1,1)), substring(last_name,2)) as formatted,
	case 
		when last_name like 'j%' or last_name like 'a%' or last_name like 'm%' then length(last_name)
        end as 'length'
 from employees; 
 
 #6
 select lpad(salary, 15, '$') as SALARY from employees;
 
#7 
select first_name from employees where first_name = reverse(first_name);

#8
select concat(upper(substring(first_name,1,1)), substring(first_name,2)) as INITCAPS from employees;

#9 doubt
select substring_index(substring_index(street_address, ' ', 2), ' ', -1) as Word from locations;

#10
select first_name, concat(substring(first_name,1,1), substring(last_name,1), "@systechusa.com") 
				   as 'E-Mail Address'  from employees;

#11
select concat(first_name,' ',last_name) as name, job_title from employees join jobs 
	on employees.job_id = jobs.job_id 
    where job_title = (select job_title from EMPLOYEES join jobs
 on employees.job_id = jobs.job_id
WHERE first_name = "Trenna");
    
 select job_title from EMPLOYEES join jobs
 on employees.job_id = jobs.job_id
WHERE first_name = "Trenna";
    
#12 
select first_name, department_name from emp_details_view where city = 'South San Francisco';

select city, department_name, first_name from 
	employees join departments
		on employees.employee_id = departments.department_id
	join locations
		on departments.location_id = locations.location_id
	where first_name = 'Trenna';
    
#13
select first_name , min(salary) from employees ;
select salary from employees where first_name = 'TJ';
select salary,first_name,last_name from employees where first_name = 'Steven';
 
 #14
 select first_name,salary from employees where salary > (select min(salary) from employees) order by salary desc;
 
 SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

#1
select last_name, department_name from employees join departments
	on employees.department_id = departments.department_id;
    
#2 
select * from departments;
select * from jobs;
select * from locations;
select d.department_id,l.street_address,j.job_title from
	locations l join departments d 
		on l.location_id = d.location_id 
	join employees e on e.department_id = d.department_id 
    join jobs j on e.job_id = j.job_id
        where d.department_id = 40;
#3
select e.last_name, d.department_name, l.city, l.location_id 
	from 
		employees e 
	join 
		departments d on e.department_id = d.department_id
	join 
		locations l on d.location_id = l.location_id
	where commission_pct is not null;

#4
select last_name, department_name from departments join employees
	on departments.department_id = employees.department_id
    where last_name like '%a%';
    
#5 in which table atlanta is given.

#6 manager's last_name and manager number is not given 
#7 manager's last_name and manager number is not given 

#8
select
	e1.last_name as employee_last_name,
    e1.department_id as employee_department,
    e2.last_name as coworker_last_name,
    e2.department_id as coworker_dept
from
    employees e1
join
    employees e2 on e1.department_id = e2.department_id
where
    e1.employee_id = e1.employee_id;

#9
select concat(first_name, ' ', last_name) as name, job_title, department_name, salary,
	case 
		when salary >= 50000 then 'A'
        when salary >= 30000 then 'B'
        else 'C'
        end as 'Grade'
from 
	employees join jobs 
		on employees.job_id = jobs.job_id
    join departments
		on employees.department_id = departments.department_id;

#10 manager name and hire date is not given

----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------

#1
select last_name, hire_date from 
	employees join departments 
		on employees.department_id = departments.location_id
	where department_name = 'Sales';

#2
select employee_id, last_name,salary from employees where 
	salary > (select avg(salary) from employees ) 
    order by salary;

#3
select department_id from employees where last_name like '%u%';

select employee_id, last_name from employees where 
	department_id in (select department_id from employees where last_name like '%u%');

#4 atlanta is in which table ?

#5 where is fillmore ?


#6
select d.department_id, e.last_name, e.job_id 
	from employees e 
		join departments d
			on e.department_id = d.department_id
        where d.department_name = 'OPERATIONS';    
	

#7
select employee_id, last_name,salary from employees where 
	department_id in (select department_id from employees where last_name like '%u%')
    and salary > (select avg(salary) from employees ) ;
    
#8
select concat(first_name, ' ',last_name) as name from 
	employees join jobs 
		on employees.job_id = jobs.job_id
	where job_title = 'Sales';
    
#9 
select concat(first_name, ' ',last_name) as name, employee_id,salary,
	case 
		when department_id in (10,30) then (salary) + ((salary)*(5/100))
		when department_id = 20 then (salary) + ((salary)*(10/100))
        when department_id in (40,50) then (salary) + ((salary)*(15/100))
        when department_id = 60 then (salary)
        end as salary_after_raise
	from employees;
    
#10
select last_name, salary from employees order by salary desc limit 3; 

#11
select concat(first_name, ' ',last_name) as name, salary,
	case 
		when commission_pct is null then 0
        else commission_pct
        end as commission_pct
	from employees;
    
#12 manager name is not given

------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------

-- DATE FUNCTION
-- 1) Find the date difference between the hire date and resignation date for all the employees. 
--    Display in no. of days, months and year (1 year 3 months 5 days). 
--    Emp_ID Hire Date Resignation Date 
-- 		1 1/1/2000 7/10/2013 
-- 		2 4/12/2003 3/8/2017
-- 		3 22/9/2012 21/6/2015 
-- 		4 13/4/2015 NULL 
-- 		5 03/06/2016 NULL 
-- 		6 08/08/2017 NULL 
-- 		7 13/11/2016 NULL

select employee_id, start_date, end_date, concat(floor(datediff(end_date, start_date) / 365), ' year ', 
floor((datediff(end_date, start_date) % 365) / 30), ' months ', datediff(end_date, start_date) % 30, ' days') as date_difference
from job_history;
    
-- 2) Format the hire date as mm/dd/yyyy (09/22/2003) and resignation date as mon dd, yyyy (Aug 12th, 2004). Display the null as (DEC, 01th 1900)

select date_format(hire_date, '%m/%d/%Y'), ifnull(date_format(end_date, '%M %D,%Y'),'DEC, 01th 1990') from employees 
left join job_history
on employees.employee_id =  job_history.employee_id; 

-- 3) Calculate experience of the employee till date in Ydears and months (example 1 year and 3 months) 
--    Use Getdate() as input date for the below three questions.

select datediff(end_date, start_date), 
concat(floor(datediff(end_date, start_date) / 365), ' year ', 
floor((datediff(end_date, start_date) % 365) / 30), ' months ', 
datediff(end_date, start_date) % 30, ' days') as date_difference
from job_history; 

-- 4) Display the count of days in the previous quarter

select count(datediff(end_date, start_date)/365) from job_history
group by datediff(end_date, start_date)/365; 

-- 5) Fetch the previous Quarter's second week's first day's date

select datediff(end_date, start_date) from job_history; 
select  dateadd(week, datediff(week, 0, getdate()), -1) from job_historys;

-- 6) Fetch the financial year's 15th week's dates (Format: Mon DD YYYY)

select year(end_date, start_date) from job_history;
 