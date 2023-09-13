create database if not exists crandb;
use crandb;
select * from cran_logs;

#1
select count(*) from cran_logs;

#2
select count(distinct package) from cran_logs;

#3
select count(*) from cran_logs where package = 'Rcpp';

#4
select count(*) from cran_logs where country = 'CN';

#5
select package, count(*) from cran_logs group by package order by 2 desc;

#6
select package, count(*) from cran_logs where time between 9 and 11 group by package order by 2 desc; 

#7
select count(*) from cran_logs where country in ("CN","JP","SG");

#8
select count(*) from cran_logs where country = 'CN';
select country,count(*) as num from cran_logs group by country having num > (select count(*) from cran_logs where country = 'CN');


#9
select distinct package from cran_logs;
select distinct package, avg(length(package)) from cran_logs group by package;

#10 
select package, count(*) as num from cran_logs group by package 
order by num desc limit 1, 1;


#11
select package, count(*) from cran_logs group by package having count(*) > 1000 order by 2 desc ;

#12
select r_os ,(count(*)/62324)*100 as Main_Sys_Percentage from cran_logs group by r_os ;