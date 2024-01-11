{{
    config(
        unique_key='id'
    )
}}
{{- log('started the data load with incremental approach set to ' ~ is_incremental(),info='True') -}}
with src_payment as (
    select *, {{is_incremental()}} as pull_method from {{ source('stripe', 'payment') }}
    {%- if is_incremental() -%}
    where created > (select coalesce(max(created),'1900-01-01') from {{ this }})
    {% endif %}    
)
select * from src_payment