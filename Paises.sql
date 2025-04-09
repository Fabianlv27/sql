/*todos los empleados que trabajan en USA*/
select employees.firstName,employees.lastName, employees.email,offices.city 
from offices
join employees on employees.officeCode=offices.officeCode 
/*Si no colocamos que solo me muestre cuando la clave foranea sea igual que la primaria, te muestra
por los nombres y apellidos por cada pais y cada combinacion posible*/
 where offices.country="USA";
 select * from customers c ,orders o where c.customerNumber=363;
 
/*total de compras (suma de dinero) y cantidad de ordenes hechas por cada pais*/

select country,count(p.amount) NumeroDePedidos,sum(p.amount) Suma, avg(p.amount) Promedio
 from customers c ,payments p 
 where c.customerNumber=p.customerNumber
 group by c.country
 ;