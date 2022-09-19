SELECT* from orders
order by order_id;

SELECT* from customers;


SELECT* from order_details
order by order_id;

--Find the total amount for the order
SELECT order_id,round(sum(((unit_price)-(discount))*quantity)) from order_details
GROUP by order_details.order_id
order by order_id;

--To display the total amount using the both the order and order details and customer
select c.company_name,o.order_id,Round (sum((od.unit_price-od.discount)*od.quantity))AS total from orders o,order_details od,customers c
where (o.order_id=od.order_id AND c.customer_id=o.customer_id)
group by o.order_id ,c.company_name
order by total desc;


--Sales made by the Shipper
select s.shipper_id,s.company_name,Round (sum((od.unit_price-od.discount)*od.quantity)) total from shippers s,orders o,order_details od
where (o.ship_via=s.shipper_id And o.order_id=od.order_id)
GROUP by s.shipper_id,s.company_name
order by total desc;

--Sales by employees
SELECT o.employee_id,e.first_name,round(sum(((od.unit_price)-(od.discount))*od.quantity)) AS total from order_details od,orders o,employees e
where (od.order_id=o.order_id AND o.employee_id=e.employee_id)
GROUP by o.employee_id,e.first_name
order by Total desc;

--creating the view 
CREATE view sales_employee AS
 SELECT o.employee_id,e.first_name AS employee_name,round(sum((od.unit_price - od.discount) * od.quantity)) 
 AS sales_by_employee FROM order_details od,orders o,employees e
  WHERE od.order_id = o.order_id AND o.employee_id = e.employee_id
  GROUP BY o.employee_id, e.first_name
  ORDER BY sales_by_employee DESC;

--Sales By Product
select od.product_id,p.product_name,round(sum((od.unit_price - od.discount) * od.quantity)) from order_details od,orders o,Products p
where (od.order_id=o.order_id AND p.product_id=od.product_id)
Group by od.product_id,p.product_name
order by od.product_id ;

--Sales by Category
select c.category_id,c.category_name,round(sum((od.unit_price - od.discount) * od.quantity)) from categories c,order_details od,products p
where (c.category_id=p.category_id And od.product_id=p.product_id)
Group by c.category_name,c.category_id
order by c.category_id;