use NORTHWND;

SELECT* from orders
order by orderid;

SELECT* from customers;


SELECT* from [Order Details]
order by orderid;

--Find the total amount for the order
Create view OrderDetails as 
SELECT od.OrderID,od.ProductID,od.Quantity,od.UnitPrice,od.Discount,(((unitprice)-(discount))*quantity) as total 
from [Order Details] as od;


--To display the total amount using the both the order and order details and customer
select c.companyname,Round(sum((od.unitprice-od.discount)*od.quantity),0)AS total from orders o,[Order Details] od,customers c
where (o.orderid=od.orderid AND c.customerid=o.customerid)
group by o.orderid ,c.companyname
order by total desc;


--Sales made by the Shipper
select s.shipperid,s.companyname,Round(sum((od.unitprice-od.discount)*od.quantity),0) total from shippers s,orders o,[Order Details] od
where (o.shipvia=s.shipperid And o.orderid=od.orderid)
GROUP by s.shipperid,s.companyname
order by total desc;

--Sales by employees
SELECT o.employeeid,e.firstname,CONCAT('$',round(sum(((od.unitprice)-(od.discount))*od.quantity),0)) AS total from [Order Details] od,orders o,employees e
where (od.orderid=o.orderid AND o.employeeid=e.employeeid)
GROUP by o.employeeid,e.firstname
order by EmployeeID;

--creating the view 
CREATE VIEW view_name AS
 SELECT o.employeeid,e.firstname AS employee_name,round(sum((od.unitprice - od.discount) * od.quantity),0) 
 AS sales_by_employee FROM [Order Details] od,orders o,employees e
  WHERE od.orderid = o.orderid AND o.employeeid = e.employeeid
  GROUP BY o.employeeid, e.firstname;

--Sales By Product
select od.productid,p.productname,round(sum((od.unitprice - od.discount) * od.quantity),0) as total_sales from [Order Details] od,orders o,Products p
where (od.orderid=o.orderid AND p.productid=od.productid)
Group by od.productid,p.productname
order by total_sales desc;

--Sales by Category
select c.categoryid,c.categoryname,round(sum((od.unitprice - od.discount) * od.quantity),0) from categories c,[Order Details] od,products p
where (c.categoryid=p.categoryid And od.productid=p.productid)
Group by c.categoryname,c.categoryid
order by c.categoryid;


--Create a view
CREATE view sales_Employee As
SELECT o.employeeid,e.firstname,round(sum(((od.unitprice)-(od.discount))*od.quantity),0) AS total from [Order Details] od,orders o,employees e
where (od.orderid=o.orderid AND o.employeeid=e.employeeid)
GROUP by o.employeeid,e.firstname
order by employeeid
--order by total desc;

--alter the view


--how to drop a view in Postgresql
--DROP VIEW sample;


--create view sample As 
select * from [Order Details];

--sales per territory
Select t.TerritoryDescription,r.RegionDescription,t.TerritoryID ,round(sum(((od.unitprice)-(od.discount))*od.quantity),0) AS total from Territories as t,EmployeeTerritories as et,Orders as o,[Order Details] as od,Region as R
where t.TerritoryID=et.TerritoryID and o.EmployeeID=et.EmployeeID and od.OrderID=o.OrderID and R.RegionID=t.RegionID
group by t.TerritoryID,t.TerritoryDescription,r.RegionDescription
order by total desc ;

--sales per customer
select c.CompanyName,c.ContactName,round(sum(((od.unitprice)-(od.discount))*od.quantity),0) AS Total_Price from Orders as o,OrderDetails as od,Customers as c
where o.CustomerID=c.CustomerID
group by c.CompanyName,c.ContactName
order by Total_Price desc;

--Sales details as per order
Create view Sales_By_as select c.CompanyName,o.CustomerID,o.OrderID,round(sum(((od.unitprice)-(od.discount))*od.quantity),0) AS Total_Price from OrderDetails as od,Orders as o,Customers as c
where o.OrderID=od.OrderID and o.CustomerID=c.CustomerID
group by c.CompanyName,o.OrderID,o.CustomerID
order by Total_Price desc;

select o.CustomerID,o.OrderID,round(sum(((od.unitprice)-(od.discount))*od.quantity),0) AS Total_Price from [Order Details] as od,Orders as o
where o.CustomerID='QUICK' and od.OrderID=o.OrderID
group by o.OrderID,o.CustomerID;

--Most ordered product in the orderDetails with the no of orders along with it
select top 1 p.ProductName,sum(od.Quantity) Quantiy_Order from [Order Details] as od,Products as p
where od.ProductID=p.ProductID
group by p.ProductName
order by Quantiy_Order desc

--
