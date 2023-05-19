{{
    config(
        materialized='incremental',
        unique='dbt_utils.surrogate_key(order_id, customer_id)',
        partition_by={
            "field":"order_date"}
    )
}}

select ROW_NUMBER() OVER (ORDER BY cust_id) + 1000 as order_id, 
cust_id as customer_id,
CASE
    WHEN rand() < 1.0/3 THEN 'Laptop'
    WHEN rand() < 2.0/3 THEN 'Card'
    ELSE 'Chip' end as order_name, 
current_date as order_date
from Shubh_Test.customer
