{{config(materialized='table')}}

select 
orderid,
lineno,
shipperid,
customerid,
productid,
employeeid,
to_date(split_part(shipmentdate,' ',1)) as shipmentdate
from
{{source('raw_qwt','shipments')}}