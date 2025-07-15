{% snapshot scd_table %}

{{
    config(
        target_schema = 'random',
        strategy = 'check',
        unique_key = 'ID',
        check_cols = ['FIRSTNAME','LASTNAME']
    )
}}

select * from  {{source("faizaan_sources","SCD_EG")}}

{% endsnapshot %}