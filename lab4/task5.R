# Рассмотрите данные из файла seeds_dataset.txt, 
# который содержит описание зерен трех сортов пшеницы: 
# Kama, Rosa and Canadian. 
# Признаки: 
# 1. область A, 2. периметр P, 3. компактность C = 4*pi*A/P^2, 
# 4. длина зерна, 5. ширина зерна, 6. коэффициент ассиметрии, 
# 7. длина колоска


seeds_table <- read.table(file = "seeds_dataset.txt", sep = ",", stringsAsFactors = TRUE)

# v1 = c(seeds_table$V1, seeds_table$V2)
v1 = seeds_table$V2

# cl <- clara(v1, k = 3)
# plot(v1, col = cl$clustering)
cl <- kmeans(v1, 3, iter.max = 5)
plot(v1, col = cl$cluster)