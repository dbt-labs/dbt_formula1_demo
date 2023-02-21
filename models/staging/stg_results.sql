WITH results AS (
    SELECT 
        RESULTID                                                                                AS result_id,
        RACEID                                                                                  AS race_id,
        DRIVERID                                                                                AS driver_id,
        CONSTRUCTORID                                                                           AS constructor_id,
        NUMBER                                                                                  AS number,
        GRID                                                                                    AS grid,
        IFF(CONTAINS("POSITION", '\N'), null, "POSITION")                                       AS driver_position,
        POSITIONTEXT                                                                            AS position_text,
        POSITIONORDER                                                                           AS position_order,
        POINTS                                                                                  AS points,
        LAPS                                                                                    AS laps,
        IFF(CONTAINS("TIME", '\N'), null, "TIME")                                               AS race_time,
        IFF(CONTAINS(MILLISECONDS, '\N'), null, MILLISECONDS)                                   AS milliseconds,
        IFF(CONTAINS(FASTESTLAP, '\N'), null, FASTESTLAP)                                       AS fastest_lap,
        "RANK"                                                                                  AS driver_rank,
        IFF(CONTAINS(FASTESTLAPTIME, '\N'), null, {{ convert_laptime('FASTESTLAPTIME') }})      AS fastest_laptime,
        IFF(CONTAINS(FASTESTLAPSPEED, '\N'), null, FASTESTLAPSPEED)                             AS fastest_lapspeed,
        STATUSID                                                                                AS status_id
    FROM {{ ref('results') }}
)

SELECT * FROM results