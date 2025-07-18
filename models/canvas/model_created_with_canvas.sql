WITH stg_customers AS (
  /* Customer data with basic cleaning and transformation applied, one row per customer. */
  SELECT
    *
  FROM {{ ref('jaffle_shop', 'stg_customers') }}
), stg_orders AS (
  /* Order data with basic cleaning and transformation applied, one row per order. */
  SELECT
    *
  FROM {{ ref('jaffle_shop', 'stg_orders') }}
), filter_1 AS (
  SELECT
    *
  FROM stg_customers
  WHERE
    NOT CUSTOMER_NAME IS NULL
), "join" AS (
  SELECT
    filter_1.CUSTOMER_ID,
    filter_1.CUSTOMER_NAME,
    stg_orders.ORDER_ID
  FROM filter_1
  LEFT JOIN stg_orders
    USING (CUSTOMER_ID)
), model_created_with_canvas AS (
  SELECT
    *
  FROM "join"
)
SELECT
  *
FROM model_created_with_canvas