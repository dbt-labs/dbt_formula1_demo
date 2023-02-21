WITH lap_times AS (
    SELECT 
        {{ dbt_utils.generate_surrogate_key(['raceid', 'driverid', 'lap']) }}   AS lap_times_id,
        raceid                                                                  AS race_id,
        driverid                                                                AS driver_id,
        lap                                                                     AS lap,
        "POSITION"                                                              AS driver_position,
        "TIME"                                                                  AS lap_time_text,
        {{ convert_laptime('lap_time_text') }}                                  AS official_laptime,
        milliseconds                                                            AS milliseconds
    FROM {{ ref('lap_times') }}
)

SELECT * FROM lap_times