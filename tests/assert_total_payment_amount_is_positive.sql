select *
from {{ ref('fct_orders') }}
where amount<0