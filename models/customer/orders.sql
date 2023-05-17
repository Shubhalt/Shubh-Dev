{{ config(materialized='table',
          partition_by={
            "field":"order_date"}) }}

with source_data as (select '1' as order_id, '1' as customer_id, 'car' as order_name, current_date as order_date
)

select *
from source_data