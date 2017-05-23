# Исследуйте, как объем обучающей выборки и количество тестовых данных, 
# влияет на точность классификации или на вероятность ошибочной 
# классификации в примере крестики-нолики и примере о спаме e-mail сообщений.

library(kernlab)
library(kknn)

data(spam)

# n <- dim(spam)[1]
# 
# set.seed(12345)
# A_rand <- spam[order(runif(n)), ]
# 
# for(i in seq(0.1, 0.9, by = 0.1)){
#   print(1 - i)
#   nt <- as.integer(n*(1 - i))
#   
#   spamtrain <- A_rand[1:nt, ]
#   spamtest <- A_rand[(nt + 1):n, ]
#   
#   spamknnn <- kknn(type~., spamtrain, spamtest, distance = 1, kernel = "triangular")
#   # summary(spamknnn)
#   
#   fit <- fitted(spamknnn)
#   fff= table(fit, spamtest$type)
#   
#   ttt = table(spamtest$type)
#   
#   print((fff[1,1] + fff[2, 2]) / (ttt[1] + ttt[2]))
# }

xo1 <- read.table(file = "Tic_tac_toe.txt", sep = ",", stringsAsFactors = TRUE)
n <- dim(xo1)[1]

set.seed(12345)
xo  <- xo1[order(runif(n)), ]

for(i in seq(0.1, 0.9, by = 0.1)){
  print(1 - i)
  
  nt <- as.integer(n*(1 - i))
  
  xotrain <- xo[1:nt, ]
  xotest  <- xo[(nt + 1):n, ]
  # print(dim(xotest))
  xokknn <- kknn(V10~., xotrain, xotest, distance = 1, kernel = "triangular")
  # print(xokknn)
  # summary(xokknn)
  
  fit <- fitted(xokknn)
  ttt = table(fit, xotest$V10)
  
  fff = table(fit)
  print((ttt[1,1] + ttt[2, 2]) / (fff[1] + fff[2]))
}
