select sum(amount) as revenue 
from {{ ref('stg_payments') }}
where status='success'