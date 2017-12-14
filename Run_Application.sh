
#! /bin/bash

# save my current directory
MY_CWD=$(pwd)

# change to application directory
cd /data/W205_Final_Project

# download data files from site into staging directory, remove headers, copy to HDFS
./loading_and_modeling/load_data_lake.sh

# create schema-on-read SQL tables of files
hive -f ./loading_and_modeling/hive_base_ddl.sql

# transform data into parquet format 1-hot encoded tables for machine learning
hive -f ./transforming/order_data_insta_ddl.sql
hive -f ./transforming/order_data_dh_ddl.sql

# combine instacart and dunnhumby tables into 1
hive -f ./transforming/order_data_combine_ddl.sql

# create auxiliary (non-1-hot encoded) table for EDA in Tableau
hive -f ./visualization/aux_for_tableau_ddl.sql

# change to machine_learning directory
cd /data/W205_Final_Project/machine_learning

# import tables and training & test machine learning model, also export .csv of results
python3 ./gs_classifier.py

# change back to main directory
cd /data/W205_Final_Project

# create SQL table for visualization of classifier results
./visualization/load_test_results.sh

# transform classifier results into parquet formatted table for visualization in Tableau
hive -f ./visualization/classifier_results_ddl.sql

# change directory back to the original
cd $MY_CWD

# clean exit
exit

