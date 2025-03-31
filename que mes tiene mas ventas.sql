-- cuales son los meses del año en en los que se genera mas ventas 
select month(orderDate) mes ,count(orderDate) cant from orders group by mes order by cant desc ;