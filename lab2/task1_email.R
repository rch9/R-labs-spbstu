install.packages("kernlab")

library(kernlab)
library(kknn)

data(spam)

spamtrain <- spam[-idx,]
spamtest <- spamtrain[idx,]