{#- Comments - create list for looping -#}
{%- set payment_methods = ['coupon','credit_card','bank_transfer','gift_card'] -%} 
with payments as (
    select * from {{ ref('stg_payments') }}
)
,final as (
    select 
        order_id,  
        {% for payment_method in payment_methods -%}
        sum(case when payment_method = '{{ payment_method }}' then amount else 0 end) as {{ payment_method }}_Amount
        {%- if not loop.last -%}
        ,
        {% endif -%}
        {%- endfor %}
    from payments
    group by order_id
)
select * from final order by order_id