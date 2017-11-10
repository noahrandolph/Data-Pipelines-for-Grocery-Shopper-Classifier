#! /bin/bash

# save my current working directory
MY_CWD=$(pwd)

# empty and remove staging directories
rm "/data/staging/project/dunnhumby_The-Complete-Journey/dunnhumby - The Complete Journey CSV"/*
rm "/data/staging/project/dunnhumby_The-Complete-Journey/dunnhumby - The Complete Journey SAS"/*
rmdir "/data/staging/project/dunnhumby_The-Complete-Journey/dunnhumby - The Complete Journey CSV"
rmdir "/data/staging/project/dunnhumby_The-Complete-Journey/dunnhumby - The Complete Journey SAS"
rm "/data/staging/project/dunnhumby_The-Complete-Journey"/*
rmdir "/data/staging/project/dunnhumby_The-Complete-Journey"
rm /data/staging/project/*
rmdir /data/staging/project
rmdir /data/staging

# remove files from hdfs
hdfs dfs -rm /user/w205/grocery_shopper_classifier/insta_aisles/insta_aisles.csv
hdfs dfs -rm /user/w205/grocery_shopper_classifier/insta_departments/insta_departments.csv
hdfs dfs -rm /user/w205/grocery_shopper_classifier/insta_order_products_prior/insta_order_products_prior.csv
hdfs dfs -rm /user/w205/grocery_shopper_classifier/insta_order_products_train/insta_order_products_train.csv
hdfs dfs -rm /user/w205/grocery_shopper_classifier/insta_orders/insta_orders.csv
hdfs dfs -rm /user/w205/grocery_shopper_classifier/insta_products/insta_products.csv
hdfs dfs -rm /user/w205/grocery_shopper_classifier/insta_sample_submission/insta_sample_submission.csv
hdfs dfs -rm /user/w205/grocery_shopper_classifier/dh_campaign_desc/dh_campaign_desc.csv
hdfs dfs -rm /user/w205/grocery_shopper_classifier/dh_campaign_table/dh_campaign_table.csv
hdfs dfs -rm /user/w205/grocery_shopper_classifier/dh_causal_data/dh_causal_data.csv
hdfs dfs -rm /user/w205/grocery_shopper_classifier/dh_coupon_redempt/dh_coupon_redempt.csv
hdfs dfs -rm /user/w205/grocery_shopper_classifier/dh_coupon/dh_coupon.csv
hdfs dfs -rm /user/w205/grocery_shopper_classifier/dh_hh_demographic/dh_hh_demographic.csv
hdfs dfs -rm /user/w205/grocery_shopper_classifier/dh_product/dh_product.csv
hdfs dfs -rm /user/w205/grocery_shopper_classifier/dh_transaction_data/dh_transaction_data.csv

# remove hdfs hospital_compare directory and sub-directories
hdfs dfs -rmdir /user/w205/grocery_shopper_classifier/insta_aisles
hdfs dfs -rmdir /user/w205/grocery_shopper_classifier/insta_departments
hdfs dfs -rmdir /user/w205/grocery_shopper_classifier/insta_order_products_prior
hdfs dfs -rmdir /user/w205/grocery_shopper_classifier/insta_order_products_train
hdfs dfs -rmdir /user/w205/grocery_shopper_classifier/insta_orders
hdfs dfs -rmdir /user/w205/grocery_shopper_classifier/insta_products
hdfs dfs -rmdir /user/w205/grocery_shopper_classifier/insta_sample_submission
hdfs dfs -rmdir /user/w205/grocery_shopper_classifier/dh_campaign_desc
hdfs dfs -rmdir /user/w205/grocery_shopper_classifier/dh_campaign_table
hdfs dfs -rmdir /user/w205/grocery_shopper_classifier/dh_causal_data
hdfs dfs -rmdir /user/w205/grocery_shopper_classifier/dh_coupon_redempt
hdfs dfs -rmdir /user/w205/grocery_shopper_classifier/dh_coupon
hdfs dfs -rmdir /user/w205/grocery_shopper_classifier/dh_hh_demographic
hdfs dfs -rmdir /user/w205/grocery_shopper_classifier/dh_product
hdfs dfs -rmdir /user/w205/grocery_shopper_classifier/dh_transaction_data
hdfs dfs -rmdir /user/w205/grocery_shopper_classifier

# change directory back to the original
cd $MY_CWD

# clean exit
exit
