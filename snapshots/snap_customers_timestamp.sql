{% snapshot snap_customers_timestamp %}

{{
    config(
        unique_key='id',
        strategy='timestamp',
        updated_at='upsertdate',
        target_schema='snap'
    )
}}

select * from {{ ref('stg_customers_incr') }}

{% endsnapshot%}