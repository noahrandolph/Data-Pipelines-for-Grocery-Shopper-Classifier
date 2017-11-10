#! /bin/bash

# save my current directory
MY_CWD=$(pwd)

# creating staging directory
mkdir /data/staging
mkdir /data/staging/project

# change to staging directory
cd /data/staging/project

# get files from Amazon S3
# instacart files
MY_URL="https://s3.amazonaws.com/w205datasource/kaggle_instacart_data/aisles.csv.zip"
wget "$MY_URL" -O aisles.zip
MY_URL="https://s3.amazonaws.com/w205datasource/kaggle_instacart_data/departments.csv.zip"
wget "$MY_URL" -O departments.zip
MY_URL="https://s3.amazonaws.com/w205datasource/kaggle_instacart_data/order_products__prior.csv.zip"
wget "$MY_URL" -O order_products_prior.zip
MY_URL="https://s3.amazonaws.com/w205datasource/kaggle_instacart_data/order_products__train.csv.zip"
wget "$MY_URL" -O order_products_train.zip
MY_URL="https://s3.amazonaws.com/w205datasource/kaggle_instacart_data/orders.csv.zip"
wget "$MY_URL" -O orders.zip
MY_URL="https://s3.amazonaws.com/w205datasource/kaggle_instacart_data/products.csv.zip"
wget "$MY_URL" -O products.zip
MY_URL="https://s3.amazonaws.com/w205datasource/kaggle_instacart_data/sample_submission.csv.zip"
wget "$MY_URL" -O sample_submisssion.zip

# get files from Amazon S3
# dunnhumby files
MY_URL="https://s3.amazonaws.com/w205datasource/dunnhumby_The-Complete-Journey.zip"
wget "$MY_URL" -O dunnhumby.zip

#unzip the instacart data
unzip aisles.zip -x __MACOSX/*
unzip departments.zip -x __MACOSX/*
unzip order_products_prior.zip -x __MACOSX/*
unzip order_products_train.zip -x __MACOSX/*
unzip orders.zip -x __MACOSX/*
unzip products.zip -x __MACOSX/*
unzip sample_submisssion.zip -x __MACOSX/*

#unzip the dunnhumby data
unzip dunnhumby.zip

# remove first line of instacart files and rename
#1
OLD_FILE_1="aisles.csv"
NEW_FILE_1="insta_aisles.csv"
tail -n +2 "$OLD_FILE_1" >$NEW_FILE_1

#2
OLD_FILE_2="departments.csv"
NEW_FILE_2="insta_departments.csv"
tail -n +2 "$OLD_FILE_2" >$NEW_FILE_2

#3
OLD_FILE_3="order_products__prior.csv"
NEW_FILE_3="insta_order_products_prior.csv"
tail -n +2 "$OLD_FILE_3" >$NEW_FILE_3

#4
OLD_FILE_4="order_products__train.csv"
NEW_FILE_4="insta_order_products_train.csv"
tail -n +2 "$OLD_FILE_4" >$NEW_FILE_4

#5
OLD_FILE_5="orders.csv"
NEW_FILE_5="insta_orders.csv"
tail -n +2 "$OLD_FILE_5" >$NEW_FILE_5

#6
OLD_FILE_6="products.csv"
NEW_FILE_6="insta_products.csv"
tail -n +2 "$OLD_FILE_6" >$NEW_FILE_6

#7
OLD_FILE_7="sample_submission.csv"
NEW_FILE_7="insta_sample_submission.csv"
tail -n +2 "$OLD_FILE_7" >$NEW_FILE_7

# change to dunnhumby files directory
cd "dunnhumby_The-Complete-Journey/dunnhumby - The Complete Journey CSV"

# remove first line of dunnhumby files and rename
#8
OLD_FILE_8="campaign_desc.csv"
NEW_FILE_8="dh_campaign_desc.csv"
tail -n +2 "$OLD_FILE_8" >$NEW_FILE_8

#9
OLD_FILE_9="campaign_table.csv"
NEW_FILE_9="dh_campaign_table.csv"
tail -n +2 "$OLD_FILE_9" >$NEW_FILE_9

#10
OLD_FILE_10="causal_data.csv"
NEW_FILE_10="dh_causal_data.csv"
tail -n +2 "$OLD_FILE_10" >$NEW_FILE_10

#11
OLD_FILE_11="coupon_redempt.csv"
NEW_FILE_11="dh_coupon_redempt.csv"
tail -n +2 "$OLD_FILE_11" >$NEW_FILE_11

#12
OLD_FILE_12="coupon.csv"
NEW_FILE_12="dh_coupon.csv"
tail -n +2 "$OLD_FILE_12" >$NEW_FILE_12

#13
OLD_FILE_13="hh_demographic.csv"
NEW_FILE_13="dh_hh_demographic.csv"
tail -n +2 "$OLD_FILE_13" >$NEW_FILE_13

#14
OLD_FILE_14="product.csv"
NEW_FILE_14="dh_product.csv"
tail -n +2 "$OLD_FILE_14" >$NEW_FILE_14

#15
OLD_FILE_15="transaction_data.csv"
NEW_FILE_15="dh_transaction_data.csv"
tail -n +2 "$OLD_FILE_15" >$NEW_FILE_15

# create our main grocery shopper classifier hdfs directory
hdfs dfs -mkdir /user/w205/grocery_shopper_classifier

# change back to staging/project directory for access to Instacart files
cd /data/staging/project

# create hdfs directory for each file and copy each file to hdfs
#1
hdfs dfs -mkdir /user/w205/grocery_shopper_classifier/insta_aisles
hdfs dfs -put $NEW_FILE_1 /user/w205/grocery_shopper_classifier/insta_aisles

#2
hdfs dfs -mkdir /user/w205/grocery_shopper_classifier/insta_departments
hdfs dfs -put $NEW_FILE_2 /user/w205/grocery_shopper_classifier/insta_departments

#3
hdfs dfs -mkdir /user/w205/grocery_shopper_classifier/insta_order_products_prior
hdfs dfs -put $NEW_FILE_3 /user/w205/grocery_shopper_classifier/insta_order_products_prior

#4
hdfs dfs -mkdir /user/w205/grocery_shopper_classifier/insta_order_products_train
hdfs dfs -put $NEW_FILE_4 /user/w205/grocery_shopper_classifier/insta_order_products_train

#5
hdfs dfs -mkdir /user/w205/grocery_shopper_classifier/insta_orders
hdfs dfs -put $NEW_FILE_5 /user/w205/grocery_shopper_classifier/insta_orders

#6
hdfs dfs -mkdir /user/w205/grocery_shopper_classifier/insta_products
hdfs dfs -put $NEW_FILE_6 /user/w205/grocery_shopper_classifier/insta_products

#7
hdfs dfs -mkdir /user/w205/grocery_shopper_classifier/insta_sample_submission
hdfs dfs -put $NEW_FILE_7 /user/w205/grocery_shopper_classifier/insta_sample_submission

# change back to dunnhumby files directory for access to the .csv files
cd "dunnhumby_The-Complete-Journey/dunnhumby - The Complete Journey CSV"

#8
hdfs dfs -mkdir /user/w205/grocery_shopper_classifier/dh_campaign_desc
hdfs dfs -put $NEW_FILE_8 /user/w205/grocery_shopper_classifier/dh_campaign_desc

#9
hdfs dfs -mkdir /user/w205/grocery_shopper_classifier/dh_campaign_table
hdfs dfs -put $NEW_FILE_9 /user/w205/grocery_shopper_classifier/dh_campaign_table

#10
hdfs dfs -mkdir /user/w205/grocery_shopper_classifier/dh_causal_data
hdfs dfs -put $NEW_FILE_10 /user/w205/grocery_shopper_classifier/dh_causal_data

#11
hdfs dfs -mkdir /user/w205/grocery_shopper_classifier/dh_coupon_redempt
hdfs dfs -put $NEW_FILE_11 /user/w205/grocery_shopper_classifier/dh_coupon_redempt

#12
hdfs dfs -mkdir /user/w205/grocery_shopper_classifier/dh_coupon
hdfs dfs -put $NEW_FILE_12 /user/w205/grocery_shopper_classifier/dh_coupon

#13
hdfs dfs -mkdir /user/w205/grocery_shopper_classifier/dh_hh_demographic
hdfs dfs -put $NEW_FILE_13 /user/w205/grocery_shopper_classifier/dh_hh_demographic

#14
hdfs dfs -mkdir /user/w205/grocery_shopper_classifier/dh_product
hdfs dfs -put $NEW_FILE_14 /user/w205/grocery_shopper_classifier/dh_product

#15
hdfs dfs -mkdir /user/w205/grocery_shopper_classifier/dh_transaction_data
hdfs dfs -put $NEW_FILE_15 /user/w205/grocery_shopper_classifier/dh_transaction_data

# change directory back to the original
cd $MY_CWD

# clean exit
exit

