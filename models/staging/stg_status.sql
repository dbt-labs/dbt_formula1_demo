WITH status AS (
    SELECT 
        -- need surogate key with race_id, driver_id and stop
        statusid    AS status_id,
        status      AS status
    FROM {{ ref('status') }}
)

SELECT * FROM status