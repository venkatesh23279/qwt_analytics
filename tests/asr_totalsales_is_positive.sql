select orderid,sum(linesalesamount) as sales 
from 
{{ref('fct_orders')}}
group by orderid
having sales < 0