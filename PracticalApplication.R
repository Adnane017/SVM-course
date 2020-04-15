####################################################################

# SVM code for the practical application in R. 
#
# Example and R code taken from the supporting material of Kirchner 
# and Signorino (2018) (the Survey Practice special issue)
#
# Here you will conduct SVM classification and Logistic regression for 
# the survey response example.  
#
# If one's computer has at least four cores, we recommend initialising 
# a parallel environment as we did below. caret's train() command will 
# automatically recognise the parallel environment and use it during 
# cross validation. To run these commands without parallelisation, 
# delete the six lines just after the part "to run in parallel" 
#
# Kirchner, A., & Signorino, C. S. (2018). Using Support Vector Machines
# for Survey Research. Survey Practice, 11(1), 2715.

####################################################################
# Load necessary libraries
####################################################################

rm(list=ls())
library(tictoc)         # To measure run time
library(kernlab)				# SVM package
library(caret)					# needed for training SVM and for 
								        # confusionMatrix()

####################################################################
# to run in parallel
####################################################################

library(parallel) 						
library(foreach)						
library(doParallel)						
threads=detectCores()					
cl=makeCluster(threads-1)				
registerDoParallel(cl)					

####################################################################
# load data and create test and training data sets.
####################################################################

# change to your path
setwd("~/Teaching/SVM_course_MLworkshop") 

# load the dataset and define the training and test sets
load("SPData2.Rda")

# Number of observations
N = nrow(SPData2)

# Divide the data into a traing and a test set
set.seed(1)
Ind_train = sample(N, (2*N)/3) # sample 2/3*N training indices 
dtrain = SPData2[Ind_train, ]
dtest = SPData2[-Ind_train, ]

####################################################################
# svm.  train() and trainControl() are part of the caret package.
####################################################################

# formula:  response variable ~ covariates
f = newrespond20 ~ age + sex  + wborace + hispanic2 + region + educ3 + incgrp4 + telstat + wrkcata  + ratcat2

# Running CV
set.seed(1)
tic()
svm.fit = train(f, data = dtrain,
                method = "svmRadial", # Sigma will be estimated from the training set directly. Try svmRadialSigma to tune sigma manually 
                tuneLength = 8,
                preProcess = NULL,
                trControl = trainControl(method = "cv", number=5))
toc()
svm.fit	# print results

### Evaluation of the performance of the svm model 
# predicted responses
r.svm = predict(svm.fit, newdata = dtest, type = "raw")		
CM.svm = confusionMatrix(r.svm, dtest$newrespond20)
# Contingency table
CM.svm$table 
# Contingency table in the form of marginal proportions
prop.table(CM.svm$table,2) 
# Overall accuracy
CM.svm$overall[1] 

####################################################################
# logistic regression
####################################################################

logit.fit = glm(f, data=dtrain, family=binomial(logit))
# predicted probs
p.logit = predict(logit.fit, newdata=dtest, type='response')  
# predicted responses
r.logit = as.factor(ifelse(p.logit>=.5, "Respondent", "NonRespondent"))		
# Evaluation
CM.logit = confusionMatrix(r.logit, dtest$newrespond20)
# Contingency table
CM.logit$table 
# Contingency table in the form of marginal proportions
prop.table(CM.logit$table,2) 
# Overall accuracy
CM.logit$overall[1] 

####################################################################
# Stop running in parallel
####################################################################

stopCluster(cl)
