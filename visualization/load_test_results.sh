#! /bin/bash

# save my current directory
MY_CWD=$(pwd)

cd /data/W205_Final_Project/machine_learning

NEW_FILE_1="classifier_results.csv"

hdfs dfs -mkdir /user/w205/grocery_shopper_classifier/nb_classifier
hdfs dfs -put $NEW_FILE_1 /user/w205/grocery_shopper_classifier/nb_classifier

# change directory back to the original
cd $MY_CWD

