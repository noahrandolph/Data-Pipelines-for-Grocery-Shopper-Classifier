DROP TABLE classifier_results;

CREATE EXTERNAL TABLE classifier_results
(
row_no string,
basket_id string,
true_category string,
predicted_category string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/grocery_shopper_classifier/nb_classifier';
