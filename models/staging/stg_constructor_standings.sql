WITH constructor_standings AS (
    SELECT     
        constructorstandingsid        AS constructor_standings_id,
        raceid                        AS race_id,
        constructorid                 AS constructor_id,
        points                        AS points,
        "POSITION"                    AS constructor_position,
        positiontext                  AS position_text,
        wins                          AS wins
    FROM {{ source('kaggle_f1', 'constructor_standings') }}
)

SELECT * FROM constructor_standings