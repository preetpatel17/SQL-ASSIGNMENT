select * from contact;
select * from employee;
select * from salesperson;

#1 bonus left
select * from contact;
select * from salesperson;
select employeeid, firstname, lastname, bonus from 
	employee join contact 
		on employee.contactid = contact.contactid
      join salesperson 
		 on contact.contactid = salesperson.salespersonid
        where bonus >= 2000;

select EmployeeID, FirstName, LastName from employee join contact 
on employee.ContactID = contact.ContactID;

select * from contact join salesperson 
on contact.ContactID = salespemployeeaddresserson.SalesPersonID;

#2
select * from stateprovince;
select * from address;

select Addressline1, CountryRegionCode, IFNULL(Addressline2,'N/A') as Updated_Address from address 
join stateprovince
on address.StateProvinceID=stateprovince.StateProvinceID
where CountryRegionCode='CA';


#3
select * from salesorderdetail;
select Name , SalesOrderDetailID from product
 join salesorderdetail
 on product.ProductID=salesorderdetail.ProductID;

#4
select productsubcategory.name as name, product.listprice as price 
from productsubcategory join product
	on productsubcategory.ProductSubcategoryID = product.ProductSubcategoryID 
where listPrice < 15 order by price desc limit 2;


#5 A
select e.employeeid, e.managerid, c.firstname 
	from employee e join contact c
		on e.ContactID  = c.ContactID;
#5 B
select employeeid, concat(firstname, ' ', lastname) as name
	from employee join contact
		on employee.ContactID = contact.ContactID
    where ManagerID is null;
#6 A
select * from productvendor;
select * from productsubcategory;
select * from vendor;
    
select product.name as product_name, product.productsubcategoryid, vendor.name
from vendor  join productvendor  
	on vendor.VendorID = productvendor.VendorID
join product
	on product.ProductID = productvendor.ProductID
    where product.ProductSubcategoryID = 15;
    
    
#6 B
select * from productvendor;
select * from product;

select product.ProductID, product.name as Product_name, count(productvendor.VendorID) as vendors 
from productvendor join product 
	on productvendor.ProductID=product.ProductID 
group by product.ProductID
having count(productvendor.VendorID) > 1 ;


#7
select * from customer;
select * from store;

select c.customerid from 
customer c left join store s 
	on c.CustomerID = s.CustomerID
where s.CustomerID is null 
group by c.CustomerID;


#8
select * from product where productid = 718;
select * from productlistpricehistory where productid = 718;

select  p.ProductID, p.standardcost, l.listprice from 
	product p join productlistpricehistory l
		on p.ProductID = l.ProductID
	where StandardCost < l.listprice and p.ProductID = 718;
    
#9 
select * from salesorderdetail;
select * from productdescription;
select productID, description , linetotal, year(salesorderdetail.ModifiedDate) as 'year' from productdescription
join salesorderdetail
on productdescription.ProductDescriptionID=salesorderdetail.ProductID
where year(salesorderdetail.ModifiedDate) = 2001;


#10
select product.productID, product.name ,  year(salesorderdetail.ModifiedDate) as year from product
join salesorderdetail
on product.ProductID=salesorderdetail.ProductID
where year(salesorderdetail.ModifiedDate) = 2001 or year(salesorderdetail.ModifiedDate) = 2002 
or year(salesorderdetail.ModifiedDate) = 2003;




