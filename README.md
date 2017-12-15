# W205_Final_Project

This application produces a grocery shopper classifier that predicts whether a grocery shopper is an Instacart-type shopper or a standard household grocery shopper.

Execute the file "Run_Application.sh" to download shopper data to HDFS, create Parquet formatted SQL tables in Hive, produce a Multinomial Naive Bayes classifier model using Scikit-Learn, make predictions on test data, create a results data file, store the file in HDFS, and finally create a Parquet formatted SQL table of the prediction results in Hive (~30 minutes total run time). 

Afterward, files "/visualizations/EDA.twb" and "/visualizations/Classifier_results_visualization.twb" can be opened to view the original exploratory data analysis as well as classifier results visualizations (Hadoop connection configuration in Tableau required).

REQUIREMENTS
1. In a Linux OS, ensure you have a storage volume attached as '/data' with at least 5 GB available
2. At least 16 GB of memory
3. Hadoop Distributed File System
4. Hive 1.1
5. Python 3 (packages required: Pyhive; Scikit learn; Pickle; Numpy; Pandas; TCLIService)
6. Tableau
