{{config(materialized='view',schema='salesmart_dev')}}

select 
employee_id,
employee_title,
employee_name,
manager_id,
manager_title,
manager_name
from
{{ref("trf_employee")}}