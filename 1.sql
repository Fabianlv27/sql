SELECT count(*) NumCliente ,city FROM customers group by city order by NumCliente ;

select count(*)NumCliente ,city from customers
group by city 
having NumCliente >2
order by NumCliente;
;
select * from customers;

select * ,coalesce(addressLine2,"no addressLine2") as Formated_AddressLine2
from offices
where country="USA"
or territory="emea"
order by city;

select products where productline="Motorcycles"
and quantityinstock >500
order by buyPrice;
select * from customers;
select * from products;
select * from offices where country="USA" and state="NY";

select count(*) pendientes from orders where status !="Shipped" and status !="cancelled";
select * from customers where customerNumber in (select customerNumber from orders);
/*nuevos*/
select * from customers where creditLimit between 71800.00 and 80000;
select sum(quantityInStock),productVendor from products where productLine="Classic Cars" group by productVendor;
select max(quantityInStock),productName from products group by productName ;
select productName,quantityInStock from products order by quantityInStock desc limit 0,1;
select * from products where quantityInStock = (select max(quantityInStock) from products);
select lower(productName) from products;
select upper(productName) from products;
select max(creditLimit);
select count(distinct(productVendor) ) from products;
 

 select month(orderDate),count(*) 
 from orders
 where orderDate 
 between "2003-01-01" and "2003-12-31" 
 group by month(orderDate)
 order by count(*) desc
 limit 0,1; 
 
  select Year(orderDate),count(*) 
 from orders
 where status="Resolved" 
 group by year(orderDate); 
 
 select * from orders;
