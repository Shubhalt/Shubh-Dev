{{
    config(
        materialized='incremental',
        unique='order_id',
        partition_by={
            "field":"order_date"}
    )
}}

select COUNT(*) OVER (ORDER BY cust_id) + 1000 as order_id, 
cust_id as customer_id,
CASE
    WHEN rand() < 1.0/3 THEN 'Laptop'
    WHEN rand() < 2.0/3 THEN 'Card'
    ELSE 'Chip' end as order_name, 
current_date as order_date
from {{ source('Shubh_Test', 'customer') }}
{% if is_incremental() %}
  -- this filter will only be applied on an incremental run
  where cust_id not in (SELECT customer_id FROM {{ this }})
{% endif %} 