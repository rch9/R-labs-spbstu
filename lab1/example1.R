library(e1071)

#stringAsFactors TRUE тк все данные котегориальные. ПОЧЕМУ?
A_row <- read.table(file = "Tic_tac_toe.txt", sep = ",", stringsAsFactors = TRUE)

n <- dim(A_row)[1]


set.seed(12345)
A_rand <- A_row[order(runif(n)), ]

#делим на обучающую и тустирующую выборки
nt <- as.integer(n*0.8)
A_train <- A_rand[1:nt, ]
A_test <- A_rand[(nt + 1):n, ]

#процентные соотношения классов
prop.table(table(A_train$V10))
prop.table(table(A_test$V10)) 


#все, кроме 10. 
A_classifier <- naiveBayes(A_train[,-10], A_train$V10)
#тут нужны пояснения 
#A_classifier <- naiveBayes(V10 ~ ., data = A_train)

#Формируем таблицу для сравнения с реальными значениями
A_predicted <- predict(A_classifier, A_test) 
table(A_predicted, A_test$V10)


#table(A_predicted)
#table(A_test$V10)