{{ config(materialized='table',
          partition_by={
            "field":"date1"}) }}

with source_data as (

    select id as id, current_date as date1 from {{ ref('demo_table') }}
    
)

select *
from source_data
