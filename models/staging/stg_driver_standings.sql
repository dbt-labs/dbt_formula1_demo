WITH driver_standings AS (
    SELECT 
        driverstandingsid   AS driver_standings_id,
        raceid              AS race_id,
        driverid            AS driver_id,
        points              AS driver_points,
        "POSITION"          AS driver_position,
        positiontext        AS position_text,
        wins                AS driver_wins
    FROM {{ ref('driver_standings') }}
)

SELECT * FROM driver_standings