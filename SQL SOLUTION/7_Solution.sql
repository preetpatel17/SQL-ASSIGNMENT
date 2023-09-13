select * from client;
select * from package;
#1
select client.name from client join package 
	on client.AccountNumber = package.Recipient
		where package.Weight = 1.5;
        
#2
select sum(p.weight) from package p join client c 
	on p.sender = c.AccountNumber 
		where c.name = "Al Gore's Head";