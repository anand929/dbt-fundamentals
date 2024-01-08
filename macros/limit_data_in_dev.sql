{% macro limit_data_in_dev(env_name='default',check_column='created_at', dev_days_in_data=3, dev_unit_of_data='day') -%}
{%- if target.name == env_name -%}
where {{ check_column }} >= CURRENT_DATE - INTERVAL '{{dev_days_in_data}} {{dev_unit_of_data}}'
--dateadd('day',-{{dev_days_in_data}},current_timestamp)
{%- endif -%}
{%- endmacro %}

