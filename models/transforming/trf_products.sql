{{config(materialized='table',schema='transforming_dev')}}

select 
p.productid,
p.productname,
c.categoryname,
s.companyname as suppliercompany,
s.contactname as sullpiercontact,
s.city as suppliercity,
s.country as suppliercountry,
p.quantityperunit,
p.unitcost,
p.unitprice,
p.unitsinstock,
p.unitsonorder,
p.unitprice-p.unitcost as profit,
iff(p.unitsinstock>p.unitsonorder,'available','not available') as productavailablity
from
{{ref("stg_products")}} as p inner join {{ref("trf_suppliers")}} as s on
p.supplierid = s.supplerid
inner join {{ ref('lkp_category')}} as c
 on c.CategoryID=p.CategoryID


