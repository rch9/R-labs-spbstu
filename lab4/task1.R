# Разбейте множество объектов из набора данных pluton в пакете «cluster» 
# на 3 кластера методом центров тяжести (kmeans). Сравните качество 
# разбиения в зависимости от максимального числа итераций алгоритма.

library(cluster)

data("pluton")

for(i in 2:10)
{
  cl <- kmeans(pluton, 3, iter.max = i) 
  plot(pluton, col = cl$cluster)
  points(cl$centers, col = 1:2, pch = 8, cex=2)
}

