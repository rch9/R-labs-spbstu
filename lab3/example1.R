library(tree)
# 
# data(iris)
# 
# ir.tr <- tree(Species ~., iris)
# 
# plot(ir.tr, type = "uniform")
# text(ir.tr)

library(maptree)
draw.tree(ir.tr)

ir.tr

ir.tr1 <- snip.tree(ir.tr, nodes = 12)
draw.tree(ir.tr1)

ir.tr2 <- prune.tree(ir.tr, k = 10)
draw.tree(ir.tr2)
