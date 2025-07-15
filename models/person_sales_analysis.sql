select *,
{{perc_change('Sales1','Sales2')}} as change_one
from {{source("faizaan_sources","CUSTOMER")}}


select *, '{{invocation_id}}' as invocation_id 
from {{source("faizaan_sources","CUSTOMER")}}
