WITH constructors AS (
    SELECT * FROM {{ ref('stg_constructors') }}
)

SELECT
    constructor_id                          AS constructor_id,
    construct_ref                           AS construct_ref,
    constructor_name                        AS constructor_name,
    constructor_nationality                 AS constructor_nationality,
    constructor_url                         AS constructor_url
FROM constructors