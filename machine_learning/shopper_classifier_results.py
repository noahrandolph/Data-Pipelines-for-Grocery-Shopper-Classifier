#Importing Libraries
import sys
from pyhive import hive
import pandas as pd
from TCLIService.ttypes import TOperationState
import numpy as np
from sklearn.naive_bayes import MultinomialNB
from sklearn.linear_model import LogisticRegression
from sklearn import metrics
import pickle

## Loading test data back to python
file_Name = 'test_data.pkl'
fileObject = open(file_Name,'rb')
test_data_loaded = pickle.load(fileObject) 
fileObject.close()

## Loading test labels back to python
file_Name = 'test_label.pkl'
fileObject = open(file_Name,'rb')
test_labels_loaded = pickle.load(fileObject) 
fileObject.close()

## Loading model back to python for further analysis

file_Name = 'finalmodel.sav'
fileObject = open(file_Name,'rb')
loaded_model = pickle.load(fileObject) 

## Making predictions using test data set
preds = loaded_model.predict(test_data_loaded)
fileObject.close()

## Calculating the accuracy
correct, total = 0, 0
for pred, label in zip(preds, test_labels_loaded):
    if pred == label: correct += 1
    total += 1
print('total: %3d  correct: %3d  accuracy: %3.2f%%' %(total, correct, 100.0*correct/total))

## Printing actual and predicted labels
print("Actual class labels")
print(test_labels_loaded[1:10])
print("Predicted class labels")
print(preds[1:10])

print("Number of instacart orders classified as dunnhumby")
print(len(test_labels_loaded[np.where(test_labels_loaded[np.where(test_labels_loaded != preds)] == "instacart")]))

print("Number of dunnhumby orders classified as instacart")
print(len(test_labels_loaded[np.where(test_labels_loaded[np.where(test_labels_loaded != preds)] == "dunnhumby")]))

## Selecting data points of interest
start_point = 100
stop_point = 200

## Writing results to a csv file to tranfer results to Tableau
classifier_results = pd.DataFrame(np.arange(start_point,stop_point), columns = ["basket_id"])
classifier_results = classifier_results.assign(true_category = test_labels_loaded[start_point:stop_point])
classifier_results = classifier_results.assign(predicted_category = preds[start_point:stop_point])
classifier_results.to_csv('classifier_results.csv', header = False)


