
select * from 
{{source("faizaan_sources","new_currency")}}



select *,convert_value(currency,cost) as x
from 
{{source("faizaan_sources","new_currency")}}

