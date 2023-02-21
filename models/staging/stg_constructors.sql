WITH constructors AS (
    SELECT * FROM {{ ref('constructors') }}
)

SELECT
    constructorid   AS constructor_id,
    constructorref  AS construct_ref,
    name            AS constructor_name,
    nationality     AS constructor_nationality,
    url             AS constructor_url
FROM constructors