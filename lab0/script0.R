#1. Сгенерируйте вектор длины N = 1000, элементами которого являются
#   реализации нормально распределенной случайной величины с математическим
#   ожиданием равным 1, и стандартным отклонением 0.3. Подсчитайте
#   статистические оценки мат. ожидания, стандарного отклонения, 
#   квантилей уровней 0.95 и 0.99 с и без использования встроенных
#   функций. Сравните результат. Исследуйте отклонение статистического
#   мат. ожидания от 1 при росте N (N = 1000, 2000, 4000, 8000, 16000, 32000).

vect0 = rnorm(n = 1000, mean = 1, sd = 0.3)

#with functions
mn0 = mean(vect0)
sd0 = sd(vect0)
qt0 = quantile(vect0, probs = c(0.95, 0.99))

print(length(vect0))

vect0[2]

vect0Len = length(vect0)
mn1 = 0
for(i in 1:vect0Len) {
  mn1 = mn1 + vect0[i]
}
mn1 = mn1 / vect0Len

sd1 = 0
for(i in 1:vect0Len) {
  sd1 = sd1 + (vect0[i] - mn1)^2
}
sd1 = sqrt(sd1 / vect0Len)

#квантиль при помощи сортировки



#2. Создайте фрейм данных из N = 20 записей со следующими полями: 
#   Nrow – номер записи, Name – имя сотрудника, BirthYear – год рождения, 
#   EmployYear – год приема на работу, Salary – зарплата. Заполните данный 
#   фрейм данными так, что Nrow изменяется от 1 до N. Name задается произвольно, 
#   BithYear распределен равномерно (случайно) на отрезке [1960, 1985], EmployYear 
#   распределен равномерно на отрезке [BirthYear+ 18, 2006], Salary для работников 
#   младше 1975 г.р. определяется по формуле Salary = (ln(2007 − EmployYear) + 1) ∗ 8000, 
#   для остальных Salary = (log2(2007 − EmployY ear) + 1) ∗ 8000.
#   Подсчитайте число сотрудников с зарплатой, большей 15000. Добавьте в таблицу поле, 
#   соответствующее суммарному подоходному налогу (ставка 13%), выплаченному сотрудником 
#   за время работы в организации, если его зарплата за каждый год начислялась согласно 
#   формулам для Salary, где вместо 2007 следует последовательно подставить
#   каждый год работы сотрудника в организации.

Employees <- data.frame(Nrow = integer(), Name = character(), BirthYear = integer(), EmployYear = integer(), Salary = double(), 
                 stringsAsFactors = FALSE)


for(i in 1:20) {
  BirthYear0 = floor(runif(n = 1, min = 1960, max = 1985 + 1))
  EmployYear0 = floor(runif(n = 1, min = BirthYear0 + 18, max = 2006 + 1))
  Salary0 = 0
  
  if(BirthYear0 > 1975) {
    Salary0 = (log(2007 - EmployYear0) + 1) * 8000
  } 
  else {
    Salary0 = (log2(2007 - EmployYear0) + 1) * 8000
  }
  
  Salary0 = round(Salary0, digits = 3)
  
  Employees <- rbind(Employees, data.frame(Nrow = i, Name = paste("name", i), BirthYear = BirthYear0, 
                                           EmployYear = EmployYear0, Salary = Salary0)) 
}

salaryMore15KCounter = 0
for(i in 1:nrow(Employees)) {
  if (Employees$Salary[i] > 15000) {
    salaryMore15KCounter = salaryMore15KCounter + 1
  }
}

Employees$"13%" <- 0
for(i in 1:nrow(Employees)) {
  SalaryFull = 0
  
  EmployYear0 = Employees$EmployYear[i]
  for(j in (EmployYear0 + 1):2007) {
    #print(j)
    Salary0 = 0
    
    if(BirthYear0 > 1975) {
      Salary0 = (log(j - EmployYear0) + 1) * 8000
    } 
    else {
      Salary0 = (log2(j - EmployYear0) + 1) * 8000
    }
    
    SalaryFull = SalaryFull + Salary0
  }
  
  Employees$`13%`[i] = SalaryFull * 0.87
}


#gl(n=2, k=2, length=10, labels = c("Male", "Female")) # Генерируем уровни factor-а
#[1] Male   Male   Female Female Male   Male   Female Female Male   Male  
#Levels: Male Female

#new column  f["new_col_name"] = 1:4
# or my.dataframe$new.col <- a.vector


#3. Напишите функцию, которая принимает на вход числовой вектор x и
#   число разбиений интервала k (по умолчанию равное числу элементов
#   вектора, разделенному на 10) и выполняет следующее: находит минимальное 
#   и максимальное значение элементов вектора x, разделяет
#   полученный отрезок [xmin; xmax] на k равных интервалов и подсчитывает 
#   число элементов вектора, принадлежащих каждому интервалу.
#   Постройте график, где по оси абсцисс откладываются середины интервалов, 
#   по оси ординат – число элементов вектора, принадлежащих интервалу, 
#   разделенное на общее число точек. Проведите эксперимент на данной функции, 
#   где x – вектор длины 5000, выборка реализаций экспоненциально распределенной 
#   случайной величины с параметром λ = 500. Приближение какого график

function(x, k = length(x) / 10) 
{
  minX = min(x)
  maxX = max(x)
}

#4. Пусть дан набор точек в xi ∈ R^d, i = 1, 2, . . . , n., каждой из которых
#   поставлено в соотвествие некоторое вещественное число y. Реализуйте метод 
#   наименьших квадратов, находящий гиперплоскость, обеспечивающую наименьшую 
#   невязку по y. Для случая d = 1 нарисуйте график, содержащий исходные
#   точки и найденную прямую.
