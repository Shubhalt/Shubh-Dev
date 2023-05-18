{{
    config(
        materialized='incremental',
        partition_by={
            "field":"date"}
    )
}}

SELECT
    cust_id,
    cust_name,
    service,
    date from fdic_banks.customer
WHERE
    date > (SELECT MAX(date) FROM {{ fdic_banks.customer }})
