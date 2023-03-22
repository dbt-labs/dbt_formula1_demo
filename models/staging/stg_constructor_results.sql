WITH constructor_results AS (
    SELECT * FROM {{ source('kaggle_f1', 'constructor_results') }}
)

SELECT 
    constructorresultsid                              AS constructor_results_id,
    raceid                                            AS race_id,
    constructorid                                     AS constructor_id,
    points                                            AS constructor_points,
    IFF(CONTAINS(status, '\N'), null, status)         AS status
FROM constructor_results