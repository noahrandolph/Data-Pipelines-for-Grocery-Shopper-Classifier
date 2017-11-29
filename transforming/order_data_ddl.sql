DROP TABLE
dh_entries;

CREATE TABLE
dh_entries AS
SELECT 
d_trans.basket_id AS basket_id,
d_product.commodity_desc AS commodity_desc
FROM d_trans
JOIN d_product
ON d_trans.product_id = d_product.product_id;


DROP TABLE
dh_entries_names_merged;

CREATE TABLE
dh_entries_names_merged AS
SELECT 
product_map.insta_aisle AS product,
dh_entries.basket_id AS basket_id
FROM product_map
JOIN dh_entries
ON dh_entries.commodity_desc = product_map.commodity_desc;


DROP TABLE
dh_orders;

CREATE TABLE
dh_orders AS
SELECT basket_id,
SUM(CASE WHEN product = 'air fresheners candles' THEN quantity ELSE NULL END) AS air_fresheners_candles,
SUM(CASE WHEN product = 'asian foods' THEN quantity ELSE NULL END) AS asian_foods,
SUM(CASE WHEN product = 'baby bath body care' THEN quantity ELSE NULL END) AS baby_bath_body_care,
SUM(CASE WHEN product = 'baby food formula' THEN quantity ELSE NULL END) AS baby_food_formula,
SUM(CASE WHEN product = 'bakery desserts' THEN quantity ELSE NULL END) AS bakery_desserts,
SUM(CASE WHEN product = 'baking ingredients' THEN quantity ELSE NULL END) AS baking_ingredients,
SUM(CASE WHEN product = 'baking supplies decor' THEN quantity ELSE NULL END) AS baking_supplies_decor,
SUM(CASE WHEN product = 'beauty' THEN quantity ELSE NULL END) AS beauty
FROM (
 SELECT 
 basket_id,
 product,
 COUNT(basket_id) AS quantity
 FROM dh_entries_names_merged
 GROUP BY basket_id, product
) sub
GROUP BY basket_id;


