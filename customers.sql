
/*Cuantas personas a su acrago tiene cada responsable*/
select count(reportsTo )from employees group by reportsTo ;

/*Muestro los nombres de los empleados y su cantidad de empleados*/
select firstName,lastName,count(*)
 from employees 
 where reportsTo 
 in (select reportsTo from employees group by reportsTo ) ;
 
 select count(*) from employees group by reportsTo;
  /*Muetra la cantidad de ordenes de cada linea*/
 select distinct(productCode) from products where productLine="Classic Cars";
 select count(*) from orderdetails O where O.productCode in (select distinct(productCode) from products where productLine="Classic Cars");
 
/* Muestra la linea de producto mas compradas por clientes*/
select P.productLine,sum(OD.quantityOrdered) S
from orderdetails OD
join products P on P.productCode=OD.productCode
group by P.productLine
order by S desc
limit 0,1;

 -- Jefes y las personas a las que manda
select e2.firstName,count(*) from employees
join employees e2 on employees.reportsTo=e2.employeeNumber
group by e2.employeeNumber
;

-- cuantos empleados tengo por cada jobtitle
select distinct(jobTitle) ,count(*) from employees group by jobTitle;

-- La ciudad de las oficinas en la que tengo mas empleados
select O.city,count(employeeNumber) Cantidad
from offices O 
join employees E on E.officeCode=O.officeCode
group by O.city
order by Cantidad desc
limit 0,1;
 -- 
 -- Muestro cuantas veces fueron vendidos cada producto
 select productVendor,sum(quantityOrdered) Total_Vendido from orderdetails OD
 join products P on P.productCode=OD.productCode
 group by P.productVendor
 order by Total_Vendido desc;

-- top 5 empleados que generan mas dinero
select salesRepEmployeeNumber,firstName , lastName,sum(P.amount) TotalVendido from customers C
join payments P on P.customerNumber=C.customerNumber
join employees E on salesRepEmployeeNumber=E.employeeNumber
 where not salesRepEmployeeNumber is null 
 group by salesRepEmployeeNumber
 order by TotalVendido desc
 limit 0,5 
 ;


-- Nombre de esos empleados con su cantidad de clientes atendidos
select firstName,lastName,Cantidad from employees E
join (select salesRepEmployeeNumber,count(salesRepEmployeeNumber) Cantidad  from customers  group by salesRepEmployeeNumber) Cant
on Cant.salesRepEmployeeNumber = employeeNumber;

-- mostrar para carine Schitt sus ordenes
select  sum( quantityOrdered * priceEach)  from customers c
join orders o on c.customerNumber=o.customerNumber
join orderdetails od on od.orderNumber=o.orderNumber
where contactFirstName="Carine" 
group by c.customerNumber;

select checkNumber, c.customerNumber,o.status  from payments p 
join customers c on c.customerNumber=p.customerNumber
join orders o on o.customerNumber=c.customerNumber;

-- cuantos productos distintos ha vendido cada empleado
select firstName,lastName,count(distinct od.productCode) differents_Products from employees e 
join customers c on c.salesRepEmployeeNumber=e.employeeNumber
join orders o on o.customerNumber=c.customerNumber
join orderdetails od on od.orderNumber=o.orderNumber
 group by e.firstName,e.lastName
order by differents_Products desc;

-- compruevo que un cliente puede pedir el mismo producto en diferentes ordenes
select firstName,lastName,od.productCode, count(od.productCode) from employees e 
join customers c on c.salesRepEmployeeNumber=e.employeeNumber
join orders o on o.customerNumber=c.customerNumber
join orderdetails od on od.orderNumber=o.orderNumber
group by firstName,lastName,od.productCode;

-- agarramos un ejemplo concreto para comprobar que la 
-- suma de todas las ordenes de leslie te la lo mismo que si no le puesieras un count
select sum(uno.dis) from (select firstName,lastName,od.productCode, count(od.productCode) dis from employees e 
join customers c on c.salesRepEmployeeNumber=e.employeeNumber
join orders o on o.customerNumber=c.customerNumber
join orderdetails od on od.orderNumber=o.orderNumber
where firstName='Leslie' and lastName ='Jennings'
group by firstName,lastName,od.productCode
order by count(od.productCode))uno 
group by uno.firstName
;


select firstName,lastName,od.productCode, count(od.productCode) dis from employees e 
join customers c on c.salesRepEmployeeNumber=e.employeeNumber
join orders o on o.customerNumber=c.customerNumber
join orderdetails od on od.orderNumber=o.orderNumber
where firstName='Leslie' and lastName ='Jennings'
group by firstName,lastName,od.productCode
order by count(od.productCode)

-- dos consultas

