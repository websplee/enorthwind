/*
Purpose: Day of the week with most orders
DBA: Humphrey M. Chinyama - hmsplee@gmail.com - +260966110147
*/
use northwind;
select count(customer_id) as TotalOrders, DayName(order_date) as CalcDayOfWeek from orders 
group by CalcDayOfWeek 
order by TotalOrders desc
LIMIT 1;