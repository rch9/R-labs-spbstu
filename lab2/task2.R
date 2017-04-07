library(kknn)

data(glass)

glass <- glass[,-1]

m <- dim(glass)[1]
idx <- sample(1:m, size = round(m/3), replace = FALSE, prob = rep(1/m, m))

glass.learn <- glass[-idx,]
glass.valid <- glass[idx,]

glass.kknn <- kknn(Type~., glass.learn, glass.valid, distance = 1, kernel = "triangular")
summary(glass.kknn)

fit <- fitted(glass.kknn)
table(fit)


test <- c(10.516, 1.7, 10.01, 1.19, 72.59, 0.43, 11.44, 0.02, 0.1)
a = kknn(Type~., glass.learn, glass.valid, test, distance = 1, kernel = "triangular")

b <- fitted(a)
b

