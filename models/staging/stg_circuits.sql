WITH circuits AS (
    SELECT * FROM {{ ref('circuits') }}
)

SELECT
    circuitid                                               AS circuit_id,
    circuitref                                              AS circuit_ref,
    name                                                    AS circuit_name,
    location                                                AS location,
    country                                                 AS country,
    lat                                                     AS lat,
    lng                                                     AS long,
    TO_NUMBER(IFF(CONTAINS(alt, 'N'), null, alt))           AS altitude,
    url                                                     AS circuit_url
FROM circuits
