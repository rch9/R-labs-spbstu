library(kknn)
## загружаем данные Iris 
data(iris)
## определяем общее количество примеров в обучающей выборке
m <- dim(iris)[1]
## посмотрим диаграмму рассеяния
pairs(iris[1:4], col = c("blue", "red", "black"))
## сгенерируем m/3 случайных целых чисел в диапазоне от 1 до m
val <- sample(1:m, size = round(m/3), replace = FALSE, prob = rep(1/m, m))
## формируем обучающую выборку
iris.learn <- iris[-val,]
## формируем выборку для тестирования
iris.valid <- iris[val,]
## запускаем процедуру kknn, используя 
## расстояние Минковского с параметром 1 и треугольное ядро
iris.kknn <- kknn(Species~., iris.learn, iris.valid, distance = 1, kernel = "triangular")
## смотрим результаты
summary(iris.kknn)
fit <- fitted(iris.kknn)
## а какое это растение (5.8, 3.1, 4.8, 0.5) ?
example <- c(5.8, 3.1, 4.8, 0.5)
kknn(Species~., iris.learn,iris.valid,  example, distance = 1, kernel = "triangular")
