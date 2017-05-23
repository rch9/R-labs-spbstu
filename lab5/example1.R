# library(datasets)
# air = airquality[, c("Ozone", "Solar.R", "Wind", "Temp")] 
# air
# plot(Ozone ~ Solar.R, data=air)
# plot(Ozone ~ Wind, data=air)
# plot(Ozone ~ Temp, data=air)
# f = lm(Ozone ~ ., data = air, subset = !is.na(Solar.R) & !is.na(Ozone)) 
# plot(f)
# f
# summary(f)


library(MASS)
library(datasets)
air = airquality[, c("Ozone", "Solar.R", "Wind", "Temp")] 
f = lm.ridge(Ozone ~ ., data = air, subset = !is.na(Solar.R) & !is.na(Ozone), lambda = seq(1, 10000, by = 10))
plot(f)
