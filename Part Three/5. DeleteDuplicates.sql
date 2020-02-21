/*
Purpose: Delete duplicate orders of the latest date
Explanation: The assumption is that a customer_ID, product_id, quantity, unit_price
			discount MUST be the same for an order to be defined as a duplicate.
            The inner select returns all duplicates. Then join the duplicates on 
            customer_id with the outer delete, and delete everything greater 
            than the minimum order
DBA: Humphrey M. Chinyama - hmsplee@gmail.com - +260966110147
*/
use northwind;
delete orders from orders inner join
(select o.id, o.customer_id, min(o.order_date) as minOrderDate, o.order_date, od.product_id, od.quantity, od.unit_price, od.discount from orders o 
inner join order_details od on o.id = od.order_id 
group by o.id, customer_id, product_id, quantity, unit_price, discount
having count(*) > 1) dups on dups.customer_id = orders.customer_id
where orders.order_date > dups.minOrderDate;