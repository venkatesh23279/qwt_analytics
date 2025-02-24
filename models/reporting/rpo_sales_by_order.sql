{{config(materialized='view',schema='reporting_dev')}}

select 
c.companyname,
c.contactname,
min(o.orderdate) as first_order_date,
max(orderdate) as recent_order_date,
count(o.orderid) as total_orders,
count(distinct p.productid) as no_of_products,
sum(o.quantity) as total_quantity,
sum(o.linesalesamount) as total_sales,
avg(o.margin) as avg_margin
from
QWT_ANALYTICS_DEV.SALESMART_DEV.FCT_ORDERS as o inner join QWT_ANALYTICS_DEV.SALESMART_DEV.DIM_CUSTOMERS as c on o.customerid = c.customerid
inner join QWT_ANALYTICS_DEV.SALESMART_DEV.DIM_PRODUCTS as p on p.productid = o.productid
group by c.companyname, c.contactname
order by total_sales desc;