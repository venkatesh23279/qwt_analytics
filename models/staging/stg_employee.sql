{{config(materialized='table')}}

select 
empid,
lastname,
firstname,
title,
hiredate,
office,
iff(extension='-','NA',extension) as extension,
reportsto,
yearsalary
from 
{{source('raw_qwt','employee')}}