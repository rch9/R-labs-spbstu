library(kernlab)
library(e1071)


#вопрос по spam. Чот я не понял как таблица устроена 
data(spam)

spam[0:1,] 

idx <- sample(1:dim(spam)[1], 20)

spamtrain <- spam[-idx,]
spamtest <- spamtrain[idx,]

model <- naiveBayes(type ~ ., data = spamtrain)

predict(model, spamtest)

table(predict(model, spamtest), spamtest$type)

predict(model, spamtest, type = "raw")