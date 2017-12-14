#! /bin/bash

# save my current working directory
MY_CWD=$(pwd)

hdfs dfs -rm /user/w205/grocery_shopper_classifier/nb_classifier/classifier_results.csv
hdfs dfs -rmdir /user/w205/grocery_shopper_classifier/nb_classifier

# change directory back to the original
cd $MY_CWD

