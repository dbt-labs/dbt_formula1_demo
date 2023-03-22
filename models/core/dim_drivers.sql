WITH drivers AS (
    SELECT 
        driver_id         AS driver_id,
        driver_ref        AS driver_ref,
        driver_number     AS driver_number,
        code              AS code,
        forename          AS forename,
        surname           AS surname,
        dob               AS dob,
        nationality       AS nationality,
        driver_url        AS driver_url
    FROM {{ ref('stg_drivers') }}
)

SELECT * FROM drivers