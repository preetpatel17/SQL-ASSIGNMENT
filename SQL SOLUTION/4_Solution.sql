select * from movies;
select * from movietheaters;

#1
select title from movies;

#2
select distinct rating from movies;

#3
select * from movies where rating is null;

#4

select * from movietheaters where movie is null;

#5
select * from movietheaters;
select * from movies;
select * from 
	movietheaters left join movies
		on movietheaters.movie = movies.code;

#6
select * from 
	movies left join movietheaters
		on movies.code = movietheaters.Movie;

#7
select  movies.title from movies left join movietheaters
	ON  movies.Code = movietheaters.Movie
		where movietheaters.movie is null;

#8
 INSERT INTO Movies(code,Title,Rating) VALUES(9,'One, Two, Three',NULL);		
 
 #9
 update movies set rating = 'G' where rating is null;
 
 #10
 delete from movietheaters where movie in (select code from  movies where rating  = 'NC-17');
 