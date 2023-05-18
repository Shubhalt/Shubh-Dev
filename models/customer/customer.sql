{{
    config(
        materialized='table',
        partition_by={
            "field":"date"}
    )
}}

SELECT
    cust_id,
    cust_name,
    service,
    date as date from {{ source('fdic_banks', 'customer') }}
