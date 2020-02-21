/*
Purpose: Hour of the day with most orders
DBA: Humphrey M. Chinyama - hmsplee@gmail.com - +260966110147
*/
use northwind;
select count(customer_id) as TotalOrders, Hour(order_date) as CalcHour from orders 
group by CalcHour
order by TotalOrders desc
LIMIT 1;