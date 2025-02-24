{{config(materialized='table',schema='transforming_dev')}}

select 
get(xmlget(supperid,'Supplierid'),'$') as supplerid,
get(xmlget(supperid,'companykey'),'$')::varchar as companyname,
get(xmlget(supperid,'contactname'),'$')::varchar as contactname,
get(xmlget(supperid,'address'),'$')::varchar as address,
get(xmlget(supperid,'city'),'$')::varchar as city,
get(xmlget(supperid,'postalcode'),'$')::varchar as postalcode,
get(xmlget(supperid,'country'),'$')::varchar as country,
get(xmlget(supperid,'phone'),'$')::varchar as phone,
get(xmlget(supperid,'fax'),'$')::varchar as fax
from {{ref("stg_suppliers")}}







