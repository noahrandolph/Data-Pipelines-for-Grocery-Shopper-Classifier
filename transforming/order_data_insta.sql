DROP TABLE aisle_name;

CREATE TABLE aisle_name as
SELECT insta_aisles.aisle as aisle, insta_products.product_id as product
FROM insta_aisles JOIN  insta_products
ON insta_aisles.aisle_id = insta_products.aisle_id;

DROP TABLE insta_prior;

CREATE TABLE insta_prior as
SELECT insta_products_prior.order_id as order_id, aisle_name.aisle as product
FROM  insta_products_prior JOIN aisle_name
ON insta_products_prior.product_id = aisle_name.product;

DROP TABLE insta_train;

CREATE TABLE insta_train as
SELECT insta_products_train.order_id as order_id, aisle_name.aisle as product
FROM  insta_products_train JOIN aisle_name
ON insta_products_train.product_id = aisle_name.product;

DROP TABLE insta_orders_combined;

CREATE TABLE insta_orders_combined as
SELECT * FROM insta_prior 
UNION ALL
SELECT * FROM insta_train;

DROP TABLE i_orders;

CREATE TABLE i_orders as
SELECT order_id as basket_id, SUM(CASE WHEN product = 'air fresheners candles' THEN quantity ELSE NULL END) AS air_fresheners_candles,
SUM(CASE WHEN product = 'asian foods' THEN quantity ELSE NULL END) AS asian_foods,
SUM(CASE WHEN product = 'baby bath body care' THEN quantity ELSE NULL END) AS baby_bath_body_care,
SUM(CASE WHEN product = 'baby food formula' THEN quantity ELSE NULL END) AS baby_food_formula,
SUM(CASE WHEN product = 'bakery desserts' THEN quantity ELSE NULL END) AS bakery_desserts,
SUM(CASE WHEN product = 'baking ingredients' THEN quantity ELSE NULL END) AS baking_ingredients,
SUM(CASE WHEN product = 'baking supplies decor' THEN quantity ELSE NULL END) AS baking_supplies_decor,
SUM(CASE WHEN product = 'beauty' THEN quantity ELSE NULL END) AS beauty,
SUM(CASE WHEN product = 'beers coolers' THEN quantity ELSE NULL END) AS beers_coolers,
SUM(CASE WHEN product = 'body lotions soap' THEN quantity ELSE NULL END) AS body_lotions_soap,
SUM(CASE WHEN product = 'bread' THEN quantity ELSE NULL END) AS bread,
SUM(CASE WHEN product = 'breakfast bakery' THEN quantity ELSE NULL END) AS breakfast_bakery,
SUM(CASE WHEN product = 'breakfast bars pastries' THEN quantity ELSE NULL END) AS breakfast_bars_pastries,
SUM(CASE WHEN product = 'bulk dried fruits vegetables' THEN quantity ELSE NULL END) AS bulk_dried_fruits_vegetables,
SUM(CASE WHEN product = 'bulk grains rice dried goods' THEN quantity ELSE NULL END) AS bulk_grains_rice_dried_goods,
SUM(CASE WHEN product = 'buns rolls' THEN quantity ELSE NULL END) AS buns_rolls,
SUM(CASE WHEN product = 'butter' THEN quantity ELSE NULL END) AS butter,
SUM(CASE WHEN product = 'candy chocolate' THEN quantity ELSE NULL END) AS candy_chocolate,
SUM(CASE WHEN product = 'canned fruit applesauce' THEN quantity ELSE NULL END) AS canned_fruit_applesauce,
SUM(CASE WHEN product = 'canned meals beans' THEN quantity ELSE NULL END) AS canned_meals_beans,
SUM(CASE WHEN product = 'canned meat seafood' THEN quantity ELSE NULL END) AS canned_meat_seafood,
SUM(CASE WHEN product = 'cat food care' THEN quantity ELSE NULL END) AS cat_food_care,
SUM(CASE WHEN product = 'cereal' THEN quantity ELSE NULL END) AS cereal,
SUM(CASE WHEN product = 'chips pretzels' THEN quantity ELSE NULL END) AS chips_pretzels,
SUM(CASE WHEN product = 'cleaning products' THEN quantity ELSE NULL END) AS cleaning_products,
SUM(CASE WHEN product = 'cocoa drink mixes' THEN quantity ELSE NULL END) AS cocoa_drink_mixes,
SUM(CASE WHEN product = 'coffee' THEN quantity ELSE NULL END) AS coffee,
SUM(CASE WHEN product = 'cold flu allergy' THEN quantity ELSE NULL END) AS cold_flu_allergy,
SUM(CASE WHEN product = 'condiments' THEN quantity ELSE NULL END) AS condiments,
SUM(CASE WHEN product = 'cookies cakes' THEN quantity ELSE NULL END) AS cookies_cakes,
SUM(CASE WHEN product = 'crackers' THEN quantity ELSE NULL END) AS crackers,
SUM(CASE WHEN product = 'deodorants' THEN quantity ELSE NULL END) AS deodorants,
SUM(CASE WHEN product = 'diapers wipes' THEN quantity ELSE NULL END) AS diapers_wipes,
SUM(CASE WHEN product = 'digestion' THEN quantity ELSE NULL END) AS digestion,
SUM(CASE WHEN product = 'dish detergents' THEN quantity ELSE NULL END) AS dish_detergents,
SUM(CASE WHEN product = 'dog food care' THEN quantity ELSE NULL END) AS dog_food_care,
SUM(CASE WHEN product = 'doughs gelatins bake mixes' THEN quantity ELSE NULL END) AS doughs_gelatins_bake_mixes,
SUM(CASE WHEN product = 'dry pasta' THEN quantity ELSE NULL END) AS dry_pasta,
SUM(CASE WHEN product = 'eggs' THEN quantity ELSE NULL END) AS eggs,
SUM(CASE WHEN product = 'energy sports drinks' THEN quantity ELSE NULL END) AS energy_sports_drinks,
SUM(CASE WHEN product = 'eye ear care' THEN quantity ELSE NULL END) AS eye_ear_care,
SUM(CASE WHEN product = 'facial care' THEN quantity ELSE NULL END) AS facial_care,
SUM(CASE WHEN product = 'feminine care' THEN quantity ELSE NULL END) AS feminine_care,
SUM(CASE WHEN product = 'first aid' THEN quantity ELSE NULL END) AS first_aid,
SUM(CASE WHEN product = 'fresh fruits' THEN quantity ELSE NULL END) AS fresh_fruits,
SUM(CASE WHEN product = 'fresh herbs' THEN quantity ELSE NULL END) AS fresh_herbs,
SUM(CASE WHEN product = 'fresh vegetables' THEN quantity ELSE NULL END) AS fresh_vegetables,
SUM(CASE WHEN product = 'frozen appetizers sides' THEN quantity ELSE NULL END) AS frozen_appetizers_sides,
SUM(CASE WHEN product = 'frozen breads doughs' THEN quantity ELSE NULL END) AS frozen_breads_doughs,
SUM(CASE WHEN product = 'frozen breakfast' THEN quantity ELSE NULL END) AS frozen_breakfast,
SUM(CASE WHEN product = 'frozen dessert' THEN quantity ELSE NULL END) AS frozen_dessert,
SUM(CASE WHEN product = 'frozen juice' THEN quantity ELSE NULL END) AS frozen_juice,
SUM(CASE WHEN product = 'frozen meals' THEN quantity ELSE NULL END) AS frozen_meals,
SUM(CASE WHEN product = 'frozen meat seafood' THEN quantity ELSE NULL END) AS frozen_meat_seafood,
SUM(CASE WHEN product = 'frozen pizza' THEN quantity ELSE NULL END) AS frozen_pizza,
SUM(CASE WHEN product = 'frozen produce' THEN quantity ELSE NULL END) AS frozen_produce,
SUM(CASE WHEN product = 'frozen vegan vegetarian' THEN quantity ELSE NULL END) AS frozen_vegan_vegetarian,
SUM(CASE WHEN product = 'fruit vegetable snacks' THEN quantity ELSE NULL END) AS fruit_vegetable_snacks,
SUM(CASE WHEN product = 'grain' THEN quantity ELSE NULL END) AS grain,
SUM(CASE WHEN product = 'hair care' THEN quantity ELSE NULL END) AS hair_care,
SUM(CASE WHEN product = 'honeys syrups nectars' THEN quantity ELSE NULL END) AS honeys_syrups_nectars,
SUM(CASE WHEN product = 'hot cereal pancake mixes' THEN quantity ELSE NULL END) AS hot_cereal_pancake_mixes,
SUM(CASE WHEN product = 'hot dogs bacon sausage' THEN quantity ELSE NULL END) AS hot_dogs_bacon_sausage,
SUM(CASE WHEN product = 'ice cream ice' THEN quantity ELSE NULL END) AS ice_cream_ice,
SUM(CASE WHEN product = 'juice nectars' THEN quantity ELSE NULL END) AS juice_nectars,
SUM(CASE WHEN product = 'kitchen supplies' THEN quantity ELSE NULL END) AS kitchen_supplies,
SUM(CASE WHEN product = 'latino foods' THEN quantity ELSE NULL END) AS latino_foods,
SUM(CASE WHEN product = 'laundry' THEN quantity ELSE NULL END) AS laundry,
SUM(CASE WHEN product = 'lunch meat' THEN quantity ELSE NULL END) AS lunch_meat,
SUM(CASE WHEN product = 'marinades meat preparation' THEN quantity ELSE NULL END) AS marinades_meat_preparation,
SUM(CASE WHEN product = 'milk' THEN quantity ELSE NULL END) AS milk,
SUM(CASE WHEN product = 'more household' THEN quantity ELSE NULL END) AS more_household,
SUM(CASE WHEN product = 'muscles joints pain relief' THEN quantity ELSE NULL END) AS muscles_joints_pain_relief,
SUM(CASE WHEN product = 'nuts seeds dried fruit' THEN quantity ELSE NULL END) AS nuts_seeds_dried_fruit,
SUM(CASE WHEN product = 'oils vinegars' THEN quantity ELSE NULL END) AS oils_vinegars,
SUM(CASE WHEN product = 'oral hygiene' THEN quantity ELSE NULL END) AS oral_hygiene,
SUM(CASE WHEN product = 'other creams cheeses' THEN quantity ELSE NULL END) AS other_creams_cheeses,
SUM(CASE WHEN product = 'packaged cheese' THEN quantity ELSE NULL END) AS packaged_cheese,
SUM(CASE WHEN product = 'packaged meat' THEN quantity ELSE NULL END) AS packaged_meat,
SUM(CASE WHEN product = 'packaged seafood' THEN quantity ELSE NULL END) AS packaged_seafood,
SUM(CASE WHEN product = 'packaged vegetables fruits' THEN quantity ELSE NULL END) AS packaged_vegetables_fruits,
SUM(CASE WHEN product = 'paper goods' THEN quantity ELSE NULL END) AS paper_goods,
SUM(CASE WHEN product = 'pasta sauce' THEN quantity ELSE NULL END) AS pasta_sauce,
SUM(CASE WHEN product = 'pickled goods olives' THEN quantity ELSE NULL END) AS pickled_goods_olives,
SUM(CASE WHEN product = 'plates bowls cups flatware' THEN quantity ELSE NULL END) AS plates_bowls_cups_flatware,
SUM(CASE WHEN product = 'prepared meals' THEN quantity ELSE NULL END) AS prepared_meals,
SUM(CASE WHEN product = 'prepared soups salads' THEN quantity ELSE NULL END) AS prepared_soups_salads,
SUM(CASE WHEN product = 'preserved dips spreads' THEN quantity ELSE NULL END) AS preserved_dips_spreads,
SUM(CASE WHEN product = 'salad dressing toppings' THEN quantity ELSE NULL END) AS salad_dressing_toppings,
SUM(CASE WHEN product = 'seafood counter' THEN quantity ELSE NULL END) AS seafood_counter,
SUM(CASE WHEN product = 'shave needs' THEN quantity ELSE NULL END) AS shave_needs,
SUM(CASE WHEN product = 'soap' THEN quantity ELSE NULL END) AS soap,
SUM(CASE WHEN product = 'soft drinks' THEN quantity ELSE NULL END) AS soft_drinks,
SUM(CASE WHEN product = 'soup broth bouillon' THEN quantity ELSE NULL END) AS soup_broth_bouillon,
SUM(CASE WHEN product = 'soy lactosefree' THEN quantity ELSE NULL END) AS soy_lactosefree,
SUM(CASE WHEN product = 'specialty wines champagnes' THEN quantity ELSE NULL END) AS specialty_wines_champagnes,
SUM(CASE WHEN product = 'spices seasonings' THEN quantity ELSE NULL END) AS spices_seasonings,
SUM(CASE WHEN product = 'spirits' THEN quantity ELSE NULL END) AS spirits,
SUM(CASE WHEN product = 'spreads' THEN quantity ELSE NULL END) AS spreads,
SUM(CASE WHEN product = 'tea' THEN quantity ELSE NULL END) AS tea,
SUM(CASE WHEN product = 'trail mix snack mix' THEN quantity ELSE NULL END) AS trail_mix_snack_mix,
SUM(CASE WHEN product = 'trash bags liners' THEN quantity ELSE NULL END) AS trash_bags_liners,
SUM(CASE WHEN product = 'vitamins supplements' THEN quantity ELSE NULL END) AS vitamins_supplements,
SUM(CASE WHEN product = 'water seltzer sparkling water' THEN quantity ELSE NULL END) AS water_seltzer_sparkling_water,
SUM(CASE WHEN product = 'white wines' THEN quantity ELSE NULL END) AS white_wines,
SUM(CASE WHEN product = 'yogurt' THEN quantity ELSE NULL END) AS yogurt,
'0' as dataset
FROM (
 SELECT
 order_id,
 product,
 COUNT(order_id) AS quantity
 FROM insta_orders_combined
 GROUP BY order_id, product
) sub
GROUP BY order_id;
