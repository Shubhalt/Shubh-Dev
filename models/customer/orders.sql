{{ config(materialized='table',
          partition_by={
            "field":"order_date"}) }}

with source_data as (
    select '1' as order_id, cust_id as customer_id,
    'car' as order_name, current_date as order_date
    from Shubh_Test.customer
)

select *
from source_data