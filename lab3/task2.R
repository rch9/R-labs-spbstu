library(DAAG)
library(tree)
library(maptree)

data(spam7)

spam7[1,]

spam7.tr <- tree(yesno ~., spam7)

draw.tree(spam7.tr)
print(spam7.tr)


for(i in 1:10) 
{
  spam7.tr1 <- prune.tree(spam7.tr, k = i, method = 'misclass')
  draw.tree(spam7.tr1)
}



# spam7.tr1 <- snip.tree(monica.tr, nodes = 4)
# 
# draw.tree(monica.tr1)
# print(monica.tr1)
