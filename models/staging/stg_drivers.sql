WITH drivers AS (
    SELECT 
        driverid                                                AS driver_id,
        driverref                                               AS driver_ref,
        IFF(CONTAINS(number, '\N'), null, number)               AS driver_number,
        code                                                    AS code,
        forename                                                AS forename,
        surname                                                 AS surname,
        dob                                                     AS dob,
        nationality                                             AS nationality,
        url                                                     AS driver_url
    FROM {{ source('kaggle_f1', 'drivers') }}
)

SELECT * FROM drivers