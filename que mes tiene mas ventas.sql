-- cuales son los meses del año en en los que se genera mas ventas 
select year(paymentDate) annio  from payments group by annio ;

-- meses de cada año
select tb1.annio, month(p.paymentDate) mes,count(p.paymentDate) cant from payments p
join (select year(paymentDate) annio from payments group by annio ) tb1
on tb1.annio= year(p.paymentDate) 
group by mes,tb1.annio
order by tb1.annio,mes;
-- promedio de ventas en cada pais
select o.country,avg(p.amount) prom from payments p
join customers c on c.customerNumber=p.customerNumber
join employees e on e.employeeNumber=c.salesRepEmployeeNumber
join offices o on o.officeCode=e.officeCode
group by o.country
order by prom desc;

-- me ordena por cantidad vendida los paises en cada mes
select o.country,month(p.paymentDate) mes,sum(p.amount) cant from payments p
join customers c on c.customerNumber=p.customerNumber
join employees e on e.employeeNumber=c.salesRepEmployeeNumber
join offices o on o.officeCode=e.officeCode
group by o.country,mes
order by mes,cant desc
;
-- en que pais se vendio mas en cada mes
select month(paymentDate) mes,sum(amount) cant from payments group by mes order by cant;

-- Empleados ordenados por oficina y por cantidad de dinero que generan
select e.firstName,e.lastName,e.officeCode,sum(p.amount) cant from payments p
join customers c on c.customerNumber=p.customerNumber
join employees e on e.employeeNumber=c.salesRepEmployeeNumber
group by e.firstName,e.lastName,e.officeCode
order by e.officeCode,cant desc;
-- saco la cantidad maxima de cada uno agrupado por oficinas
select Max(tb2.cant) maxcant,tb2.officeCode
from (select e.firstName,e.lastName,e.officeCode,sum(p.amount) cant from payments p
join customers c on c.customerNumber=p.customerNumber
join employees e on e.employeeNumber=c.salesRepEmployeeNumber
group by e.firstName,e.lastName,e.officeCode
order by e.officeCode,cant desc) tb2
group by tb2.officeCode;

-- Empleado que mas dinero genera por cada oficina
-- comparo la consulta 1 y solo muestro los empleados cuya cantidad y codigo de oficina aparesca en la consulta 2
select tb1.firstName,tb1.lastName,tb1.officeCode,tb1.cant
from(select e.firstName,e.lastName,e.officeCode,sum(p.amount) cant from payments p
join customers c on c.customerNumber=p.customerNumber
join employees e on e.employeeNumber=c.salesRepEmployeeNumber
group by e.firstName,e.lastName,e.officeCode
order by e.officeCode,cant desc) tb1
join (select Max(tb2.cant) maxcant,tb2.officeCode
from (select e.firstName,e.lastName,e.officeCode,sum(p.amount) cant from payments p
join customers c on c.customerNumber=p.customerNumber
join employees e on e.employeeNumber=c.salesRepEmployeeNumber
group by e.firstName,e.lastName,e.officeCode
order by e.officeCode,cant desc) tb2
order by e.officeCode,cant desc) tb2
group by tb2.officeCode)tb3
on tb3.maxcant=tb1.cant and tb3.officeCode=tb1.officeCode;

-- otro metodo
select e.employeeNumber,e.officeCode,sum(p.amount)cant
from employees e, payments p, customers c
where e.employeeNumber = c.salesRepEmployeeNumber
and p.customerNumber = c.customerNumber
group by e.employeeNumber,e.officeCode;

select R.officeCode,max(R.cant) cant from(select e.employeeNumber empleado,e.firstName,e.lastName,e.officeCode,sum(p.amount)cant
from employees e, payments p, customers c
where e.employeeNumber = c.salesRepEmployeeNumber
and p.customerNumber = c.customerNumber
group by e.employeeNumber,e.officeCode)R
group by R.officeCode;

select R2.officeCode, R2.cant from (select e.employeeNumber,e.officeCode,sum(p.amount)cant
from employees e, payments p, customers c
where e.employeeNumber = c.salesRepEmployeeNumber
and p.customerNumber = c.customerNumber
group by e.employeeNumber,e.officeCode) R1,(select R.officeCode,max(R.cant) cant from(select e.employeeNumber empleado,e.firstName,e.lastName,e.officeCode,sum(p.amount)cant
from employees e, payments p, customers c
where e.employeeNumber = c.salesRepEmployeeNumber
and p.customerNumber = c.customerNumber
group by e.employeeNumber,e.officeCode)R
group by R.officeCode) R2
where R2.officeCode=R1.officeCode and R2.cant=R1.cant
group by 



