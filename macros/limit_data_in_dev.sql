{% macro limit_data_in_dev(env_name='default') -%}
{%- if target.name == env_name -%}
where created_at >= dateadd('day',-3,current_timestamp)
{%- endif -%}
{%- endmacro %}