do $$
DECLARE x int  :=sum((order_details.unit_price-order_details.discount)*order_details.quantity) from order_details;
BEGIN
Raise Notice 'Test the name %',x;
END$$
select o.customer_id  from shippers s,orders o, od
where (o.ship_via=s.shipper_id And o.order_id=od.order_id And x>10000)
GROUP by o.customer_id

