        select *,
            'DROP ' || case 
                when table_type = 'VIEW'
                    then table_type
                else 
                    'TABLE'
            end || ' {{ database | upper }}.' || table_schema || '.' || table_name || ';'
        from {{ target.database }}.information_schema.tables 
        where table_schema = '{{ target.schema }}'