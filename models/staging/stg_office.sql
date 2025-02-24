{{config(materialized='table')}}

select 
office as office ,
address,
officepostalcode as postalcode,
officecity as city,
officestateprovince as stateprovince,
officephone as phone,
officefax as fax,
officecountry as country
from 
{{source('raw_qwt','office')}}