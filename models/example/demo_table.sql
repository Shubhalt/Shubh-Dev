{{ config(materialized='table',
          partition_by={
            "field":"date"}) }}

with source_data as (

    select 1 as id, current_date as date
    union all
    select 2 as id, current_date as date
    union all
    select 3 as id, current_date as date
    union all
    select 4 as id, current_date as date
    union all
    select 5 as id, current_date as date
)

select *
from source_data