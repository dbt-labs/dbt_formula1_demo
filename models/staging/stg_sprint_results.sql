WITH sprint_results AS (
    SELECT 
        resultid                                                                                AS result_id,
        raceid                                                                                  AS race_id,
        driverid                                                                                AS driver_id,
        constructorid                                                                           AS constructor_id,
        number                                                                                  AS driver_number,
        grid                                                                                    AS grid,
        IFF(CONTAINS("POSITION", '\N'), null, "POSITION")                                       AS driver_position,
        positiontext                                                                            AS position_text,
        positionorder                                                                           AS position_order,
        points                                                                                  AS points,
        laps                                                                                    AS laps,
        IFF(CONTAINS("TIME", '\N'), null, "TIME")                                               AS sprint_time,
        IFF(CONTAINS(milliseconds, '\N'), null, milliseconds)                                   AS milliseconds,
        IFF(CONTAINS(fastestlap, '\N'), null, fastestlap)                                       AS fastest_lap,
        IFF(CONTAINS(fastestlaptime, '\N'), null, {{ convert_laptime('fastestlaptime') }})      AS fastest_laptime,
        statusid                                                                                AS status_id
    FROM {{ source('kaggle_f1', 'sprint_results') }}
)

SELECT * FROM sprint_results