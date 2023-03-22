WITH circuits AS (
    SELECT * FROM {{ source('kaggle_f1', 'circuits') }}
)

SELECT
    circuitid                                               AS circuit_id,
    circuitref                                              AS circuit_ref,
    name                                                    AS circuit_name,
    location                                                AS circuit_location,
    country                                                 AS circuit_country,
    lat                                                     AS lat,
    lng                                                     AS long,
    TO_NUMBER(IFF(CONTAINS(alt, 'N'), null, alt))           AS altitude,
    url                                                     AS circuit_url
FROM circuits
