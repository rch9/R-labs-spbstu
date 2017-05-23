# Исследуйте, как объем обучающей выборки и количество тестовых данных, 
# влияет на точность классификации или на вероятность ошибочной 
# классификации в примере крестики-нолики и примере о спаме e-mail сообщений.

library(kernlab)
library(kknn)


rm(list = ls())
wrongres = c()
ntpoints = c()

data(spam)
n <- dim(spam)[1]
set.seed(randu)

koff = 0.01
step = 100

for (i in 1:22) {
  
  nt <- as.integer(n * koff)

  # print("n = ")
  # print(n)
  # print("nt = ")
  # print(nt)
  
  xo <- spam[order(runif(n)), ]
  
  spamtrain <- xo[1:nt, ]
  spamtest <- xo[(nt + 1):(nt + 1 + step), ]
  
  
  spamknnn <- kknn(type~., spamtrain, spamtest, distance = 1, kernel = "triangular")
  # summary(spamknnn)
  
  fit <- fitted(spamknnn)
  res = table(fit, spamtest$type)
  
  wrongres[i] = res[1, 2] + res[2, 1]
  ntpoints[i] = nt
  #   
  koff = koff + 0.05
}

# xob <- read.table(file = "Tic_tac_toe.txt", sep = ",", stringsAsFactors = TRUE)
# n <- dim(xob)[1]
set.seed(randu)
# 
# koff = 0.05
# step = 250
# 
# for(i in 1:15) {
#   
#   nt <- as.integer(n * koff)
#   
#   print("n = ")
#   print(n)
#   print("nt = ")
#   print(nt)
#   
#   xo <- xob[order(runif(n)), ]
#   # меняем местами для пункта 1
#   xotest <- xo[1:nt, ]
#   xotrain  <- xo[(nt + 1):(nt + 1 + step), ]
#   
#   xokknn <- kknn(V10~., xotrain, xotest, distance = 1, kernel = "triangular")
#   # summary(xokknn)
#   
#   fit <- fitted(xokknn)
#   res = table(fit, xotest$V10) 
#   
#   wrongres[i] = res[1, 2] + res[2, 1]
#   ntpoints[i] = nt
#   
#   koff = koff + 0.05
#   
# }

plot(ntpoints, wrongres)