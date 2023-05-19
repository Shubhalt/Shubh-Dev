{{
    config(
        materialized='incremental',
        unique='cust_id',
        partition_by={
            "field":"created_dt"}
    )
}}

SELECT
    cust_id,
    cust_name,
    service,
    created_at as created_dt from {{ source('fdic_banks', 'customer') }}
    WHERE 
    -- For the initial run
    (dbt.is_incremental() = false) OR
    -- For subsequent runs
    (dbt.is_incremental() = true AND created_at > (SELECT MAX(created_dt) FROM {{ this }}))