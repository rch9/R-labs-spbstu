# Разбейте множество объектов из набора данных pluton в пакете «cluster» 
# на 3 кластера методом центров тяжести (kmeans). Сравните качество 
# разбиения в зависимости от максимального числа итераций алгоритма.

library(cluster)

data("pluton")

# for(i in 2:10)
# {
#   cl <- kmeans(pluton, 3, iter.max = i) 
#   plot(pluton, col = cl$cluster)
#   points(cl$centers, col = 1:2, pch = 8, cex=2)
# }

library(cluster)
tot.withinss <- c()
for(i in seq(2,100)){
  cl <- kmeans(pluton,3,iter.max = i)
  tot.withinss <- append(tot.withinss, cl$tot.withinss)
  print(cl$tot.withinss)
  print(i)
}
plot(seq(2,100), tot.withinss, xlab='iter.max',ylab='tot.withinss')


cl <- kmeans(pluton, 3, iter.max = 100)
plot(pluton, col = cl$cluster)
points(cl$centers, col = 1:2, pch = 8, cex=2)