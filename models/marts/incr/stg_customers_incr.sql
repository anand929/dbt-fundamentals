{#
1. If not unique key defined, dbt will append the records with insert script
2. If unique key defined, dbt will upsert the records with merge script
3. By default, new columns added to upper layer will not be picked up by dbt.
4. on_schema_change='ignore', any schema change will be ignored.
5. on_schema_change='fail', The source and target schemas on this incremental model are out of sync!
6. on_schema_change='append_new_columns', alter target table add new columns
7. on_schema_change='sync_all_columns', alter target table add/drop columns wrt source
   Note:None of the on_schema_change behaviors backfill values in old records for newly added columns.
#}

{{
    config(       
        unique_key='id',
        on_schema_change='ignore'        
    )

}}

with src_customers as (
    select *,{{ is_incremental() }} as pull_method from {{ source("jaffle_shop",'customers') }}
    {% if is_incremental() %}
    where id > (select coalesce(99,max(id)) from {{ this }})
    {% endif %}
)
select *, now() as upsertdate from src_customers