library(e1071)

data(iris)

iris[0:1,]

#Разбиение по парам?
pairs(iris[1:4], main="Iris Data (red=setosa,green=versicolor,blue=virginica)", 
      pch=21, bg=c("red","green3","blue")[unclass(iris$Species)]) 

#первые 12
head(iris,n=12)

#инфа по таблице
summary(iris)

# байесом по всей выборке. Потом её же класифицируем
classifier<-naiveBayes(iris[,1:4], iris[,5])
predicted.classes <- predict(classifier, iris[,-5]) 
head(predicted.classes, n=12)

# так всё равно есть ошибки классификации
table(predicted.classes, iris[,5], dnn=list('predicted','actual')) 

classifier$apriori / sum(classifier$apriori) # the prior distribution for the classes
classifier$tables$Petal.Length

plot(0:3, xlim=c(0.5,7), col="red", ylab="density", type="n", xlab="Petal Length", 
     main="Petal length distribution for each species")

curve(dnorm(x, classifier$tables$Petal.Length[1,1], classifier$tables$Petal.Length[1,2]), add=TRUE, col="red")
curve(dnorm(x, classifier$tables$Petal.Length[2,1], classifier$tables$Petal.Length[2,2]), add=TRUE, col="blue")
curve(dnorm(x, classifier$tables$Petal.Length[3,1], classifier$tables$Petal.Length[3,2]), add=TRUE, col ="green")
legend("topright", c("setosa", "versicolor", "virginica"), col = c("red","blue","green"), lwd=1)
observation <- data.frame(Sepal.Length = 5.0, Sepal.Width  = 3.2, Petal.Length = 1.5, Petal.Width  = 0.3)

# type="raw" shows the probabilities 
predict(classifier, observation, type="raw")