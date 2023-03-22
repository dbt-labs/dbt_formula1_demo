WITH lap_times AS (
    SELECT 
        lap_times_id        AS lap_times_id,
        race_id             AS race_id,
        driver_id           AS driver_id,
        lap                 AS lap,
        driver_position     AS driver_position,
        lap_time_text       AS lap_time_text,
        official_laptime    AS official_laptime,
        milliseconds        AS milliseconds
    FROM {{ ref('stg_lap_times') }}
)

SELECT * FROM lap_times