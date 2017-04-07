library(tree)
library(maptree)

data(iris)

ir.tr <- tree(Species ~., iris)

plot(ir.tr, type = "uniform")
text(ir.tr)

draw.tree(ir.tr)

print(ir.tr)

ir.tr1 <- snip.tree(ir.tr, nodes = 12)
draw.tree(ir.tr1)

print(ir.tr1)

ir.tr2 <- prune.tree(ir.tr, k = 10)
draw.tree(ir.tr2)

print(ir.tr2)


par(pty = "s")


plot(iris[, 3], iris[, 4], type = "n", xlab = "X1 petal length", ylab = "X2 petal width") 
text(iris[, 3], iris[, 4], c("s", "c", "v")[iris[, 5]], col=c("blue", "red", "black")[iris[, 5]])
partition.tree(ir.tr1, add = TRUE)


