/*
Purpose: Average time that consumer/user tends to purchase again
DBA: Humphrey M. Chinyama - hmsplee@gmail.com - +260966110147
*/
use northwind;
select avg(avgDaysInterval) from 
(select customer_id, datediff(max(order_date), min(order_date))/count(customer_id) as avgDaysInterval 
from orders
group by customer_id) as tmpTbl;
