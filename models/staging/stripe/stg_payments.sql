select
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,
    --amount / 100 as amount, -- amount is stored in cents, convert it to dollars
    {{ cents_to_dollars(column_name='amount') }} as amount,
    created as created_at
from {{ source('stripe', 'payment') }}
{{ limit_data_in_dev(env_name='dev',check_column='created',dev_days_in_data=10, dev_unit_of_data='year') }}
