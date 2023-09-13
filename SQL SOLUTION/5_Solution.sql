select * from pieces;
select * from providers;
select * from provides;

#1
select name from pieces;

#2
select * from providers;

#3
select pieces.code, avg(price) from pieces join provides on pieces.Code = provides.Piece group by provides.Piece;

#4
select provides.provider from provides where piece = 1;

#5
select pieces.name, provides.Provider from pieces join provides on pieces.Code = provides.Piece where provides.Provider = 'HAL';

#6 doubt in sub query
select * from provides;
select * from pieces;
select * from providers;

select pieces.name, max(price), providers.Name as Provider_Name from pieces join provides
			on pieces.code = provides.Piece 
		join providers 
			on providers.Code = provides.Provider
		group by pieces.Name ;

#7
insert into Provides values (1, 'TNBC', 7);
  
#8
update provides set price = price + 1;

#9
delete from provides where provider = 'rbt' and Piece = 4;

#10
delete from provides where provider = 'rbt';