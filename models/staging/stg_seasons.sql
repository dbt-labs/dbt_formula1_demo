WITH seasons AS (
    SELECT 
        -- need surogate key with race_id, driver_id and stop
        "YEAR"  AS season_year,
        url     AS season_url
    FROM {{ source('kaggle_f1', 'seasons') }}
)

SELECT * FROM seasons