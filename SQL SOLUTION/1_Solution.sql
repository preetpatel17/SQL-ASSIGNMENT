create database if not exists manufacturerdb;
use manufacturerdb;

CREATE TABLE Manufacturers (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL,
  PRIMARY KEY (Code)   
);

CREATE TABLE Products (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL ,
  Price DECIMAL NOT NULL ,
  Manufacturer INTEGER NOT NULL,
  PRIMARY KEY (Code), 
  FOREIGN KEY (Manufacturer) REFERENCES Manufacturers(Code)
) ENGINE=INNODB;

INSERT INTO Manufacturers(Code,Name) VALUES(1,'Sony');
INSERT INTO Manufacturers(Code,Name) VALUES(2,'Creative Labs');
INSERT INTO Manufacturers(Code,Name) VALUES(3,'Hewlett-Packard');
INSERT INTO Manufacturers(Code,Name) VALUES(4,'Iomega');
INSERT INTO Manufacturers(Code,Name) VALUES(5,'Fujitsu');
INSERT INTO Manufacturers(Code,Name) VALUES(6,'Winchester');

INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(1,'Hard drive',240,5);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(2,'Memory',120,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(3,'ZIP drive',150,4);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(4,'Floppy disk',5,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(5,'Monitor',240,1);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(6,'DVD drive',180,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(7,'CD drive',90,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(8,'Printer',270,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(9,'Toner cartridge',66,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(10,'DVD burner',180,2);

desc manufacturers;
desc products;

#1.1
select name from products;

#1.2
select name, price from products;

#1.3
select * from products;
select name from products where price <= 200;

#1.4
select * from products where price between 60 and 120;

#1.5
select name, (price*100) as price_in_cents from products;

#1.6
select  avg(price) from products;

#1.7
select m.name, avg(price) as avg_price from 
products p join manufacturers m
on p.code = m.code 
where m.code = 2;

#1.8
select count(*) from products where price >= 180;

#1.9
select name, price from products where price >= 180 order by 2 desc, 1 asc;

#1.10
select * from products join manufacturers 
 on products.code =  manufacturers.code;

#1.11
select p.name as Product_Name, p.price, m.name as Manufacture_Name from 
products p join manufacturers m 
on p.code = m.code;

#1.12
select avg(price), manufacturer from Products group by manufacturer;

#1.13
select avg(price), m.name from 
products p join manufacturers m
on p.code = m.code
group by m.name;

#1.14
select m.name, avg(p.price) from 
products p join manufacturers m
on p.code = m.code
group by m.name
having avg(p.price) >= 150;

#1.15
select name, price from products where price = (select min(price) from products);

#1.16 doubt
-- Select the name of each manufacturer along with the name and price of its most expensive product.
select products.name, products.price, manufacturers.name from 
	products  join manufacturers  
		on products.Manufacturer = manufacturers.code
	where products.Price in (select max(price) from products group by Manufacturer );

#1.17
 INSERT INTO Products( Code, Name , Price , Manufacturer)
  VALUES ( 11, 'Loudspeakers' , 70 , 2 );
  
#1.18
update products
	set name = 'Laser Printer'
    where code = 8;
    
#1.19
 UPDATE Products
   SET Price = Price - (Price * 0.1);

#1.20
 update Products
   set price = price - (price * 0.1)
   where price >= 120;
   
   