{{config(materialized='table', schema= 'transforming_dev')}}
select
c.CUSTOMERID,
c.COMPANYNAME ,
c.ContactName ,
c.City ,
c.Country ,
c.DivisionID ,
c.Address ,
c.Fax ,
c.Phone ,
substr(c.PostalCode,1,5) as zipcode ,
CASE WHEN COALESCE(c.StateProvince,'')='' THEN 'NA' ELSE StateProvince END AS STATE
from {{ ref('stg_customers')}} as c
inner join {{ ref('lkp_divisons')}} as d
 on c.DivisionID=d.DivisionID