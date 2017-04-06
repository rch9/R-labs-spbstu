#stringAsFactors TRUE тк все данные котегориальные. ПОЧЕМУ?
A_row <- read.table(file = "Tic_tac_toe.txt", sep = ",", stringsAsFactors = TRUE)

n <- dim(A_row)[1]


set.seed(12345)
A_rand <- A_row[order(runif(n)), ]

#делим на обучающую и тустирующую выборки
nt <- as.integer(n*0.8)
A_train <- A_rand[1:nt, ]
A_test <- A_rand[(nt + 1):n, ]

# A_row

xo <- kknn(V10~., A_train, A_test, distance = 1, kernel = "triangular")

summary(xo)
fit <- fitted(xo)

table(A_test$V10)
table(fit)


