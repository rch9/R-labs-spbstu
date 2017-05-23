library(kernlab)
library(e1071)


#вопрос по spam. Чот я не понял как таблица устроена 
data(spam)

spam[0:1,] 

n <- dim(spam)[1]

set.seed(12345)
A_rand <- spam[order(runif(n)), ]

nt <- as.integer(n*0.9)

# idx <- sample(1:dim(spam)[1], 20)

spamtrain <- A_rand[1:nt, ]
spamtest <- A_rand[(nt + 1):n, ]

model <- naiveBayes(type ~ ., data = spamtrain)

predicted = predict(model, spamtest)

resspam = table(predicted, spamtest$type)
tpred = table(predicted)

resspam
tpred

print((resspam[1, 1] + resspam[2, 2]) / (tpred[1] + tpred[2]))

# table(spamtest$type)


#predict(model, spamtest, type = "raw")


#делим на обучающую и тустирующую выборки
