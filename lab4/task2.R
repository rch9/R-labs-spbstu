

# 1
x1 <- cbind(rnorm(130, mean = 1, sd = 2), rnorm(200, mean = 5, sd = 0.1))
x2 <- cbind(rnorm(120, mean = 0, sd = 2), rnorm(200, mean = 7, sd = 0.2))
x3 <- cbind(rnorm(140, mean = 10, sd = 0.2), rnorm(100, mean = 4, sd = 2))
x <- rbind(x1, x2, x3)
plot(x[,1],x[,2], xlab = "x", ylab = "y")

# 2
cl_f <- clara(x, 3, stand = F)
cl_t <- clara(x, 3, stand = T)
plot(x, col = cl_f$clustering, xlab = "x", ylab = "y")
plot(x, col = cl_t$clustering, xlab = "x", ylab = "y")

cl_e <- clara(x, 3, metric = 'euclidean')
cl_m <- clara(x, 3, metric= 'manhattan')
plot(x, col = cl_e$clustering, xlab = "x", ylab = "y")
plot(x, col = cl_m$clustering, xlab = "x", ylab = "y")


# 3
data <- votes.repub
plot(agnes(data))

# 4
data <- animals
plot(agnes(data))


# 5
seeds_table <- read.table(file = "seeds_dataset.txt", sep = ",", stringsAsFactors = TRUE)
seeds_table$V8


cl <- clara(seeds_table, 3, metric = 'manhattan')
plot(seeds_table, col = cl$cluster)

table(seeds_table$V8, cl$clustering)
