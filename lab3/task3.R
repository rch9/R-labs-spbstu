# Загрузите набор данных nsw74psid1 из пакета DAAG. 
# Постройте регресионное дерево для модели, задаваемой следующей 
# формулой: re78 ~.. Постройте регресионную модель и 
# SVM-регрессию для данной формулы. Сравните качество 
# построенных моделей, выберите оптимальную и объясните свой выбор

library(DAAG)
library(tree)
library(maptree)

data(nsw74psid1)

nsw74psid1[1,]

nsw.tr <- tree(re78 ~., nsw74psid1)

draw.tree(nsw.tr)
print(nsw.tr)


monica.tr1 <- snip.tree(monica.tr, nodes = 4)

draw.tree(monica.tr1)
print(monica.tr1)






