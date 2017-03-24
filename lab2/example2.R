# install.packages("mlbench")
# install.packages("kknn")
library(mlbench)
library(kknn)
## загружаем данные Ionospere 
data(ionosphere)
## смотрим количество примеров и признаков в ionosphere
dim(ionosphere)
## смотрим заголовки признаков и классов
ionosphere[0,]
## смотрим метки классов всех примеров
ionosphere[,"class"]
## выбираем первые 200 примеров для обучения
ionosphere.learn <- ionosphere[1:200,]
## оставшиеся примеры используем для тестирования
ionosphere.valid <- ionosphere[-c(1:200),]
## запускаем процедуру kknn
fit.kknn <- kknn(class ~ ., ionosphere.learn, ionosphere.valid)
## запускаем процедуру train.kknn, используя 
## расстояние Минковского с параметром 1 и с различными ядрами, максимальное K для поиска оптимального K равно 15
fit.train1 <- train.kknn(class ~ ., ionosphere.learn, kmax = 15,kernel = c("triangular", "rectangular", "epanechnikov", "optimal"), distance = 1)
fit.train2 <- train.kknn(class ~ ., ionosphere.learn, kmax = 15, kernel = c("triangular", "rectangular", "epanechnikov", "optimal"), distance = 2)
plot(fit.train1)
plot(fit.train2)

