WITH drivers AS (
    SELECT 
        driverid          AS driver_id,
        driverref         AS driver_ref,
        number            AS driver_number,
        code              AS code,
        forename          AS forename,
        surname           AS surname,
        dob               AS dob,
        nationality       AS nationality,
        url               AS driver_url
    FROM {{ ref('drivers') }}
)

SELECT * FROM drivers