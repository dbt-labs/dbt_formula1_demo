WITH results AS (
    SELECT 
        resultid                                                                                  AS result_id,
        raceid                                                                                    AS race_id,
        driverid                                                                                  AS driver_id,
        constructorid                                                                             AS constructor_id,
        number                                                                                    AS driver_number,
        grid                                                                                      AS grid,
        IFF(CONTAINS(POSITION, '\N'), null, POSITION)                                             AS driver_position,
        positiontext                                                                              AS position_text,
        positionorder                                                                             AS position_order,
        points                                                                                    AS points,
        laps                                                                                      AS laps,                                                     
        IFF(CONTAINS("TIME", '\N'), null, "TIME")                                                 AS race_time,
        IFF(CONTAINS(milliseconds, '\N'), null, milliseconds)                                     AS milliseconds,
        IFF(CONTAINS(fastestlap, '\N'), null, fastestlap)                                         AS fastest_lap,
        "RANK"                                                                                    AS driver_rank,
        IFF(CONTAINS(fastestlaptime, '\N'), null, {{ convert_laptime('fastestlaptime') }})        AS fastest_laptime,
        IFF(CONTAINS(fastestlapspeed, '\N'), null, fastestlapspeed)                               AS fastest_lapspeed,
        statusid                                                                                  AS status_id
    FROM {{ source('kaggle_f1', 'results') }}
)

SELECT * FROM results