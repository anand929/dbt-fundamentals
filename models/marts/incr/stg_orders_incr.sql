{{ log('started the data load with incremental approach set to ' ~ is_incremental(),info='True')}}
with src_orders as (
    select *, {{ is_incremental() }} as pull_method from {{ source('jaffle_shop', 'orders') }}
    {% if is_incremental() %}
    where _etl_loaded_at > (select max(_etl_loaded_at) from {{ this }})
    {% endif %}
)
select * from src_orders