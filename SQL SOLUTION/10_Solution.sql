select * from people;
select * from address;

-- SELECT p.name, a.address
-- FROM people p
-- LEFT JOIN (
--     SELECT id, MIN(address) AS address
--     FROM address
--     GROUP BY id
-- ) a ON p.id = a.id;


#1
select people.id , people.name, address.address
from people left join address on
people.id = address.id
group by people.id
order by address.address
 limit 5;

#2
select * from people join address on people.id = address.id group by people.id order by updatedate desc;