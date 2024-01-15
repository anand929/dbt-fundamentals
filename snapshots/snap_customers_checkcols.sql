{% snapshot snap_customers_checkcols %}
    {{
        config(
            target_schema='snap',
            unique_key='id',
            strategy='check',
            check_cols='all'
        )
    }}
    select * from {{ ref('stg_customers_incr') }}
{% endsnapshot%}