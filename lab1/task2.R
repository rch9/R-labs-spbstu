library(e1071)

# train

X1 = c(rnorm(50, mean = 10, sd = 4), rnorm(50, mean = 20, sd = 3))
X2 = c(rnorm(50, mean = 14, sd = 4), rnorm(50, mean = 18, sd = 3))
TYPE = c(rep.int("1", 50), rep.int("2", 50))

f = data.frame(X1, X2, TYPE)

pairs(f[1:2], main = "2types", pch = 21, bg=c("red", "blue")[unclass(f$TYPE)])

classifier <- naiveBayes(f[,-3], f$TYPE)


# test
set.seed(64761)

X1 = c(rnorm(50, mean = 10, sd = 4), rnorm(50, mean = 20, sd = 3))
X2 = c(rnorm(50, mean = 14, sd = 4), rnorm(50, mean = 18, sd = 3))
TYPE = c(rep.int("1", 50), rep.int("2", 50))



f_test = data.frame(X1, X2, TYPE)

print(f_test)

predictedd = predict(classifier, f_test[,-3]) 

print(classifier)

table(predictedd) 
table(f_test$TYPE)

table(predictedd, f_test$TYPE)

