{# 
schema change   | snapshot response
column added    | snapshot will add column
column removed  | snapshot will not remove column
data type change| snapshot will only increase the varchar size, no other data type changes will be supported
#}
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