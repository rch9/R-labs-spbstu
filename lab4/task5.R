# Рассмотрите данные из файла seeds_dataset.txt, 
# который содержит описание зерен трех сортов пшеницы: 
# Kama, Rosa and Canadian. 
# Признаки: 
# 1. область A, 2. периметр P, 3. компактность C = 4*pi*A/P^2, 
# 4. длина зерна, 5. ширина зерна, 6. коэффициент ассиметрии, 
# 7. длина колоска


seeds_table <- read.table(file = "seeds_dataset.txt", sep = ",", stringsAsFactors = TRUE)

# 
# # v1 = c(seeds_table$V1, seeds_table$V2)
# v1 = seeds_table$V1
# v2 = seeds_table$V2
# v3 = seeds_table$V3
# v4 = seeds_table$V4
# v5 = seeds_table$V5
# v6 = seeds_table$V6
# v7 = seeds_table$V7
# 
# v123 = c(v1, v2, v3)
# v4567 = c(v4, v5, v6, v7)
# 
# 
# # plot(v1, col = cl$clustering)
# cl1 <- clara(v123, k = 3)
# cl2 <- clara(v4567, k = 3)
# plot(v123, col = cl1$cluster)
# plot(v4567, col = cl2$cluster)