create database if not exists warehousedb;
use warehousedb;

CREATE TABLE Warehouses (
   Code INTEGER NOT NULL,
   Location VARCHAR(255) NOT NULL ,
   Capacity INTEGER NOT NULL,
   PRIMARY KEY (Code)
 );
CREATE TABLE Boxes (
    Code CHAR(4) NOT NULL,
    Contents VARCHAR(255) NOT NULL ,
    Value REAL NOT NULL ,
    Warehouse INTEGER NOT NULL,
    PRIMARY KEY (Code),
    FOREIGN KEY (Warehouse) REFERENCES Warehouses(Code)
 ) ENGINE=INNODB;
 
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(1,'Chicago',3);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(2,'Chicago',4);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(3,'New York',7);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(4,'Los Angeles',2);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(5,'San Francisco',8);
 
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('0MN7','Rocks',180,3);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4H8P','Rocks',250,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4RT3','Scissors',190,4);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('7G3H','Rocks',200,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8JN6','Papers',75,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8Y6U','Papers',50,3);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('9J6F','Papers',175,2);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('LL08','Rocks',140,4);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P0H6','Scissors',125,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P2T6','Scissors',150,2);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('TU55','Papers',90,5);


select * from warehouses;
select * from boxes;

#1
select location from warehouses;

#2
select * from boxes where value > 150;

#3
select distinct Contents from boxes;

#4
select * from boxes;
select avg(value) from boxes;

#5
select boxes.Warehouse, avg(value) from boxes group by boxes.Warehouse;

#6
select boxes.Warehouse, avg(value) from boxes group by boxes.Warehouse having avg(value) > 150;

#7
select * from warehouses;
select * from boxes;

select boxes.code as Box_Code, warehouses.Location from 
	warehouses join boxes
		on warehouses.code = boxes.Warehouse;
        
#8
select warehouses.code as warehouse_code, count(boxes.Code) as no_boxes
	from warehouses join boxes
		on warehouses.Code = boxes.Warehouse
	group by warehouses.code;
    
#9
select warehouses.code as warehouse_code, warehouses.Capacity,count(boxes.Code) as no_boxes 
	from warehouses join boxes 
		on warehouses.Code = boxes.Warehouse
	group by warehouses.code
    having count(boxes.Code) > warehouses.Capacity;
    
#10
select boxes.code
	from boxes join warehouses
    on boxes.warehouse = warehouses.code
    where warehouses.Location = 'Chicago';
    
#11
select * from warehouses;
insert into warehouses (code,location, capacity) values (6,'New York', 3);

#12
insert into boxes (code, Contents, value, warehouse) values ('H5RT', 'Papers', 200, 2);

#13
update boxes set value = (value) - (value*(15/100));

#14
select * from boxes;
delete from boxes where boxes.value < 100;

#15
delete from boxes where Warehouse = 1;