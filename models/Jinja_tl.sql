select *
from {{source("faizaan_sources","CUSTOMER")}}

{% set c=dbt_utils.get_column_values(source("faizaan_sources","CUSTOMER"),'name')%}

{% for i in c %}
{{i}}
{% endfor %}


{{c}}


select * from 
{{source("faizaan_sources","DIM_PAY")}}


select order_id,
sum(case when payment_mode = 'UPI' then sales end) as upi_sales,
sum(case when payment_mode = 'CASH' then sales end) as cash_sales,
sum(case when payment_mode = 'CC' then sales end) as cc_sales,
sum(case when payment_mode = 'DC' then sales end) as dc_sales,
sum(case when payment_mode = 'VOUCHER' then sales end) as voucher_sales
from
{{source("faizaan_sources","DIM_PAY")}}
group by order_id


{% set payment_modes=dbt_utils.get_column_values(source("faizaan_sources","DIM_PAY"),'payment_mode')%}
select 
{% for i in payment_modes%}
sum(case when payment_mode='{{i}}' then sales end) as {{i}}_sales,
{%endfor%}
from {{source("faizaan_sources","DIM_PAY")}}







