WITH pitstops AS (
    SELECT
        -- need surogate key with race_id, driver_id and stop
        raceid                                  AS race_id,
        driverid                                AS driver_id,
        stop                                    AS stop,
        lap                                     AS lap,
        "TIME"                                  AS pitstop_time,
        duration                                AS pitstop_duration_text,
        {{ convert_laptime('duration') }}       AS pitstop_duration,
        milliseconds                            AS milliseconds
    FROM {{ ref('pit_stops') }}
)

SELECT * FROM pitstops