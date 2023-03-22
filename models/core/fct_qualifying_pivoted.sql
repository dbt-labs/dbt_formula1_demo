WITH qualifying AS (
    SELECT 
        *
    FROM {{ ref('stg_qualifying') }}
        UNPIVOT(lap_time FOR qualifying_round IN (q1_time, q2_time, q3_time))
            ORDER BY qualifying_id, qualifying_round
), formatted_quali AS (

    SELECT
        {{ dbt_utils.generate_surrogate_key(['qualifying_id', 'qualifying_round']) }}       AS qualifying_pivoted_id,
        qualifying_id                                                                       AS qualifying_id,
        race_id                                                                             AS race_id,
        driver_id                                                                           AS driver_id,
        constructor_id                                                                      AS constructor_id,
        driver_number                                                                       AS driver_number,
        qualifying_position                                                                 AS qualifying_position,
        CASE 
            WHEN qualifying_round = 'Q1_TIME' THEN '1'
            WHEN qualifying_round = 'Q2_TIME' THEN '2'
            WHEN qualifying_round = 'Q3_TIME' THEN '3'
            ELSE 'invalid'
        END                                                                                 AS qualifying_round,
        lap_time                                                                            AS lap_time
    FROM qualifying

)

SELECT * FROM formatted_quali