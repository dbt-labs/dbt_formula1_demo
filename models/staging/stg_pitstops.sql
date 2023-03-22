WITH pitstops AS (
    SELECT
        raceid                                                                    AS race_id,
        driverid                                                                  AS driver_id,
        stop                                                                        AS stop,
        lap                                                                         AS lap,
        "TIME"                                                                      AS pitstop_time,
        duration                                                                    AS pitstop_duration_text,
        {{ convert_laptime('duration') }}                                           AS pitstop_duration,
        milliseconds                                                                AS milliseconds
    FROM {{ source('kaggle_f1', 'pit_stops') }}
)

SELECT
    {{ dbt_utils.generate_surrogate_key(['race_id', 'driver_id', 'stop']) }}          AS pitstop_id,
    * 
FROM pitstops