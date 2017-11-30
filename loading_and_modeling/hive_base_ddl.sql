DROP TABLE insta_products;

CREATE EXTERNAL TABLE insta_products
(
product_id string,
product_name string,
aisle_id string,
department_id string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)

STORED AS TEXTFILE
LOCATION '/user/w205/grocery_shopper_classifier/insta_products';


DROP TABLE insta_products_train;

CREATE EXTERNAL TABLE insta_products_train
(
order_id string,
product_id string,
add_to_cart_order string,
reordered string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)

STORED AS TEXTFILE
LOCATION '/user/w205/grocery_shopper_classifier/insta_order_products_train';


DROP TABLE insta_products_prior;

CREATE EXTERNAL TABLE insta_products_prior
(
order_id string,
product_id string,
add_to_cart_order string,
reordered string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)

STORED AS TEXTFILE
LOCATION '/user/w205/grocery_shopper_classifier/insta_order_products_prior';


DROP TABLE insta_orders;

CREATE EXTERNAL TABLE insta_orders
(
order_id string,
user_id string,
eval_set string,
order_number string,
order_dow string,
order_hour_of_day string,
days_since_prior string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)

STORED AS TEXTFILE
LOCATION '/user/w205/grocery_shopper_classifier/insta_orders';


DROP TABLE insta_dept;

CREATE EXTERNAL TABLE insta_dept
(
department_id string,
department string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)

STORED AS TEXTFILE
LOCATION '/user/w205/grocery_shopper_classifier/insta_departments';


DROP TABLE insta_aisles;

CREATE EXTERNAL TABLE insta_aisles
(
aisle_id string,
aisle string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)

STORED AS TEXTFILE
LOCATION '/user/w205/grocery_shopper_classifier/insta_aisles';


DROP TABLE d_trans;

CREATE EXTERNAL TABLE d_trans
(
household_key string,
basket_id string,
day string,
product_id string,
quantity string,
sales_value string,
store_id string,
retail_disc string,
trans_time string,
week_no string,
coupon_disc string,
coupon_match_disc string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)

STORED AS TEXTFILE
LOCATION '/user/w205/grocery_shopper_classifier/dh_transaction_data';


DROP TABLE d_product;

CREATE EXTERNAL TABLE d_product
(
product_id string,
manufacturer string,
department string,
brand string,
commodity_desc string,
sub_commodity_desc string,
curr_size_of_product string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)

STORED AS TEXTFILE
LOCATION '/user/w205/grocery_shopper_classifier/dh_product';


DROP TABLE product_map;

CREATE EXTERNAL TABLE product_map
(
commodity_desc string,
insta_aisle string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)

STORED AS TEXTFILE
LOCATION '/user/w205/grocery_shopper_classifier/product_mapping';
