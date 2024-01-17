{% set v_metadata =  dbt_metadata_envs %}

SELECT 
'{{ env_var("DBT_VARIABLE") }}' AS DBT_VARIABLE,
'{{ env_var('DBT_VARIABLE_DOES_NOT_EXIST', 'VARIABLE NOT DEFINED') }}' AS NEW_VARIABLE,
--DBT_ENV_SECRET_VARIABLE, secret variables are allowed only in profiles.yml/packages.yml
'{{ env_var('DBT_ENV_CUSTOM_ENV_VARIABLE') }}' AS CUSTOM_VARIABLE,
{% for k,v in v_metadata.items() -%}
'{{ k }}' AS {{ k|upper }},
'{{ v }}' AS {{ v|upper }}
{% endfor %}
