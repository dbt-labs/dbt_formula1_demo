WITH seasons AS (
    SELECT 
        -- need surogate key with race_id, driver_id and stop
        "YEAR"  AS season_year,
        url     AS url
    FROM {{ ref('seasons') }}
)

SELECT * FROM seasons