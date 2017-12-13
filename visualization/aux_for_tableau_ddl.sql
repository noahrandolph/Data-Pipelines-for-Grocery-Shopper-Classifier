

DROP TABLE aux_4_tableau_insta;

CREATE TABLE aux_4_tableau_insta AS
SELECT 
insta_orders.order_id AS basket_id,
insta_orders_combined.product AS product, 
CAST(insta_orders.order_dow AS bigint) AS day_of_week,
CAST(insta_orders.order_hour_of_day AS bigint) AS hour_of_day,
'instacart' AS dataset
FROM insta_orders_combined
JOIN insta_orders
ON insta_orders_combined.order_id = insta_orders.order_id;


DROP TABLE aux_4_tableau_dh;

CREATE TABLE aux_4_tableau_dh AS
SELECT
DISTINCT basket_id,
product,
CAST(day_of_week AS bigint) as day_of_week,
CAST(hour_of_day AS bigint) as hour_of_day,
'dunnhumby' AS dataset
FROM dh_entries_day_of_week;



DROP TABLE aux_4_tableau;

CREATE TABLE aux_4_tableau AS
SELECT 
DISTINCT basket_id, 
product, 
day_of_week, 
hour_of_day,
dataset
FROM aux_4_tableau_insta

UNION ALL

SELECT *
FROM aux_4_tableau_dh;

