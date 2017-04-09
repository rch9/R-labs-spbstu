library(DAAG)
library(tree)
library(maptree)

data(monica)

monica[0,]

monica.tr <- tree(outcome ~., monica)

draw.tree(monica.tr)
print(monica.tr)

monica.tr1 <- snip.tree(monica.tr, nodes = 4)

draw.tree(monica.tr1)
print(monica.tr1)