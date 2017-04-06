# Исследуйте, как объем обучающей выборки и количество тестовых данных, 
# влияет на точность классификации или на вероятность ошибочной 
# классификации в примере крестики-нолики и примере о спаме e-mail сообщений.

library(kernlab)
library(kknn)

# data(spam)
# 
# idx <- sample(1:dim(spam)[1], 20)
# 
# spamtrain <- spam[-idx,]
# spamtest <- spamtrain[idx,]
# 
# 
# spamknnn <- kknn(type~., spamtrain, spamtest, distance = 1, kernel = "triangular")
# summary(spamknnn)
# 
# fit <- fitted(spamknnn)
# table(fit, spamtest$type)

xo <- read.table(file = "Tic_tac_toe.txt", sep = ",", stringsAsFactors = TRUE)

idx <- sample(1:dim(xo)[1], 20)

xotrain <- xo[-idx,]
xotest  <- xo[idx,]

xokknn <- kknn(V10~., xotrain, xotest, distance = 1, kernel = "triangular")
summary(xokknn)

fit <- fitted(xokknn)
table(fit, xotest$V10)