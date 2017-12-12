
#Importing Libraries
import sys
from pyhive import hive
import pandas as pd
from TCLIService.ttypes import TOperationState
import numpy as np
from sklearn.naive_bayes import MultinomialNB
from sklearn import metrics

#Check point
print("Accessing hive data")

# Reading data from hive by class, which allows for balancing of skewed number of records
print("Importing 300,000 random Instacart orders")
df_insta = pd.read_sql("SELECT * FROM orders_for_analysis WHERE dataset=\"instacart\" ORDER BY RAND() LIMIT 300000", 
                  hive.connect('ec2-52-91-71-23.compute-1.amazonaws.com'))
print("Importing 300,000 random Dunnhumby orders")
df_dh = pd.read_sql("SELECT * FROM orders_for_analysis WHERE dataset=\"dunnhumby\" ORDER BY RAND() LIMIT 300000", 
                  hive.connect('ec2-52-91-71-23.compute-1.amazonaws.com'))
# Check point
print("Data loading complete")

# Converting all values to numeric
print("Converting all values to numeric and concatenating into 1 Numpy array")
for i in range(1,109):
    df_insta.iloc[:,i] = pd.to_numeric(df_insta.iloc[:, i], errors='coerce').fillna(0)
for i in range(1,109):
    df_dh.iloc[:,i] = pd.to_numeric(df_dh.iloc[:, i], errors='coerce').fillna(0)

# Converting to numpy array
data_numpy_insta = np.asarray(df_insta)
data_numpy_dh = np.asarray(df_dh)

data_numpy = np.concatenate((data_numpy_insta, data_numpy_dh), axis=0)

#Shuffling data and splitting into test and train
X, Y = data_numpy[:,1:109], data_numpy[:,109]
print("Shuffling data")
shuffle = np.random.permutation(np.arange(len(data_numpy)))
X, Y = X[shuffle], Y[shuffle]

# Split into train and test.
train_percentage = int(.8*len(data_numpy))
train_data, train_labels = X[:train_percentage], Y[:train_percentage]
test_data, test_labels = X[train_percentage:], Y[train_percentage:]

#Check point
print("Starting Machine Learning")

# Initalizing Naive Bayes Classifier
clf_MNB = MultinomialNB()
clf_MNB.fit(train_data, train_labels)

print("Naive Bayes Classifier Model Fit. Predicting values...")

preds = clf_MNB.predict(test_data)

print("Computing accuracy of shopper predictions...")

correct, total = 0, 0
for pred, label in zip(preds, test_labels):
    if pred == label: correct += 1
    total += 1
print('total: %3d  correct: %3d  accuracy: %3.2f%%' %(total, correct, 100.0*correct/total))
