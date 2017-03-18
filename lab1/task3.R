# task 3

# read (data type is list)
titanic_train <- read.csv(file = "train.csv", header = TRUE, sep = ",")
titanic_test <- read.csv(file = "test.csv", header = TRUE, sep = ",")
gender_submission <- read.csv(file = "gender_submission.csv", header = TRUE, sep = ",")

# need convert to factor
titanic_train$Survived = factor(titanic_train$Survived)

# bayes
classifier <- naiveBayes(titanic_train[,-2], titanic_train$Survived)

# predict
predicted <- predict(classifier, titanic_test) 

# results

table(predicted)

# table(predictedd, f_test$TYPE)
