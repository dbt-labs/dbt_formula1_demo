WITH qualifying AS (
    SELECT 
        qualifyid                                   AS qualify_id,
        raceid                                      AS race_id,
        driverid                                    AS driver_id,
        constructorid                               AS constructor_id,
        number                                      AS number,
        "POSITION"                                  AS qualifying_position,
        IFF(CONTAINS(q1, '\N'), 
                null, 
                {{ convert_laptime('q1') }} )       AS q1_time,
        IFF(CONTAINS(q2, '\N'), 
                null, 
                {{ convert_laptime('q2') }} )       AS q2_time,
        IFF(CONTAINS(q3, '\N'), 
                null, 
                {{ convert_laptime('q3') }} )       AS q3_time
    FROM {{ ref('qualifying') }}
)

SELECT * FROM qualifying