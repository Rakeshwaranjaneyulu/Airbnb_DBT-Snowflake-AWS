{{
  config(
    severity= 'warn',
    )
}}

SELECT
    1
FROM    
    {{ source('staging','booking')}}
WHERE
    BOOKING_AMOUNT < 200