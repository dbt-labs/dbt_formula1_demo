WITH races AS (
    SELECT 
        raceid          AS race_id,
        "YEAR"          AS race_year,
        "ROUND"         AS race_round,
        circuitid       AS circuit_id,
        NAME            AS race_name,
        DATE            AS race_date,
        TIME            AS race_time,
        URL             AS race_url,
        FP1_DATE        AS fp1_date,
        FP1_TIME        AS fp1_time,
        FP2_DATE        AS fp2_date,
        FP2_TIME        AS fp2_time,
        FP3_DATE        AS fp3_date,
        FP3_TIME        AS fp3_time,
        QUALI_DATE      AS quali_date,
        QUALI_TIME      AS quali_time,
        SPRINT_DATE     AS sprint_date,
        SPRINT_TIME     AS sprint_time
    FROM {{ source('kaggle_f1','races') }}
)

SELECT * FROM races