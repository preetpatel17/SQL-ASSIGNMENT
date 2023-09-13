select * from projects;
select * from scientists;
select * from assignedto;

#1
select scientists.name as Scientist_Name, projects.Name as Project_Name, projects.Hours from 
	scientists join assignedto 
		on scientists.SSN = assignedto.Scientist 
	join projects
		on projects.Code = assignedto.Project
	order by 2,1;

#2
select name from projects where code not in (select project from assignedto);   