{% macro cents_to_dollars(column_name,round_value=2) -%}
    round({{column_name}}*1.0/100,{{round_value}})
{%- endmacro -%}