WITH lap_times AS (
    SELECT 
        raceid                                                                      AS race_id,
        driverid                                                                    AS driver_id,
        lap                                                                         AS lap,
        "POSITION"                                                                  AS driver_position,
        "TIME"                                                                      AS lap_time_text,
        {{ convert_laptime('lap_time_text') }}                                      AS official_laptime,
        milliseconds                                                                AS milliseconds
    FROM {{ source('kaggle_f1', 'lap_times') }}
)

SELECT 
    {{ dbt_utils.generate_surrogate_key(['race_id', 'driver_id', 'lap']) }}         AS lap_times_id,
    * 
FROM lap_times