{% macro limit_data_in_dev(env_name='default') -%}
{%- if target.name == env_name -%}
where created >= CURRENT_DATE + INTERVAL '3 day'--dateadd('day',-3,current_timestamp)
{%- endif -%}
{%- endmacro %}