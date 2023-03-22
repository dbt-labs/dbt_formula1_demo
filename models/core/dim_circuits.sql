{{ config(
    tags=["dimension", "track"]
) }}

WITH circuits AS (
    SELECT * FROM {{ ref('stg_circuits') }}
)

SELECT
    {{ dbt_utils.generate_surrogate_key(['circuit_id']) }}      AS dim_circuit_id,
    circuit_id                                                  AS circuit_id,
    circuit_ref                                                 AS circuit_ref,
    circuit_name                                                AS circuit_name,
    circuit_location                                            AS circuit_location,
    circuit_country                                             AS circuit_country,                
    lat                                                         AS lat,
    long                                                        AS long,
    altitude                                                    AS altitude,
    circuit_url                                                 AS circuit_url
FROM circuits