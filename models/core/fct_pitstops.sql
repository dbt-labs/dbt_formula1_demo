WITH pitstops AS (
    SELECT
        pitstop_id                              AS pitstop_id,
        race_id                                 AS race_id,
        driver_id                               AS driver_id,
        stop                                    AS stop,
        lap                                     AS lap,
        pitstop_time                            AS pitstop_time,
        pitstop_duration_text                   AS pitstop_duration_text,
        pitstop_duration                        AS pitstop_duration,
        milliseconds                            AS milliseconds
    FROM {{ ref('stg_pitstops') }}
)

SELECT * FROM pitstops