/*
Purpose: script to get the order (product name) most bought for the first time
DBA: Humphrey M. Chinyama - hmsplee@gmail.com - +260966110147
*/
use northwind;
select count(productName) as maxCount, productName from
(select o.customer_id, min(o.order_date), a.product_name as productName
from orders o inner join 
	(select od.order_id as id, od.product_id, p.product_name from order_details od inner join 
	 products p on od.product_id = p.id) a on
o.id = a.id
group by o.customer_id, a.product_name) b
group by productName
order by maxCount desc
LIMIT 1;

