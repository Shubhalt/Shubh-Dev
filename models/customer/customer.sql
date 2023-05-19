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
    {% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    where created_dt >= (select max(created_dt) from {{ this }})
    {% endif %}