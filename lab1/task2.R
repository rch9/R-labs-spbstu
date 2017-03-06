X1 = c(rnorm(50, mean = 10, sd = 4), rnorm(50, mean = 20, sd = 3))
X2 = c(rnorm(50, mean = 14, sd = 4), rnorm(50, mean = 18, sd = 3))
TYPE = c(rep.int(1, 50), rep.int(2, 50))

f = data.frame(X1, X2, TYPE)

pairs(f[1:2], main = "i am god")