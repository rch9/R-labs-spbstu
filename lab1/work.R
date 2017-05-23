library(e1071)
rm(list = ls())
wrongres = c()
ntpoints = c()

A_row <- read.table(file = "Tic_tac_toe.txt", sep = ",", stringsAsFactors = TRUE)
n <- dim(A_row)[1]
set.seed(randu)

koff = 0.05
step = 100

for(i in 1:22) {
  
  A_rand <- A_row[order(runif(n)), ]
  
  #делим на обучающую и тустирующую выборки
  nt <- as.integer(n * koff)
  A_train <- A_rand[1:nt, ]
  A_test <- A_rand[(nt + 1):(nt + 1 + step), ]
  
  A_classifier <- naiveBayes( A_train[,-10], A_train$V10)
  
  
  #Формируем таблицу для сравнения с реальными значениями
  A_predicted <- predict(A_classifier, A_test) 
  res = table(A_predicted, A_test$V10)
  
  print(nt)
  print(res)
  wrongres[i] = res[1, 2] + res[2, 1]
  ntpoints[i] = nt
  
  koff = koff + 0.05
}
print(wrongres)
plot(ntpoints, wrongres)