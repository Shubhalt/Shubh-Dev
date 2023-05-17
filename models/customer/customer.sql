{{
    config(
        materialized='incremental',
        partition_by={
            "field":"date"}
    )
}}

SELECT
    '1' as cust_id,
    'Shubh' as cust_name,
    'IT' as service,
    current_date as date
FROM
    customer
WHERE
    date > (SELECT MAX(date) FROM {{ customer }})
