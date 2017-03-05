library(kernlab)
library(e1071)


#вопрос по spam. Чот я не понял как таблица устроена 
data(spam)

spam[0:1,] 

idx <- sample(1:dim(spam)[1], 20)

spamtrain <- spam[-idx,]
spamtest <- spamtrain[idx,]

model <- naiveBayes(type ~ ., data = spamtrain)

predicted = predict(model, spamtest)

table(predicted, spamtest$type)
table(predicted)
table(spamtest$type)


#predict(model, spamtest, type = "raw")