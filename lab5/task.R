library(mlbench)
library(adabag)
set.seed(411)
data("Vehicle")

N <- length(Vehicle[,1])
samp <- sample(1:N, 0.7*N)
maxdepth <- 5

errors <- c()

for(n in seq(1, 301, 10)){
  res <- boosting(Class ~., data=Vehicle[samp,], mfinal=n, maxdepth=maxdepth)
  res.pred <- predict.boosting(res, newdata=Vehicle[-samp, ])
  errors <- append(errors, res.pred$error)
  print(n)
}

plot(seq(1, 301,10), errors, xlab='trees', ylab='errors',type='l')

errors

# 2


data(Glass)
set.seed(411)
N <- length(Glass[,1])
sub <- sample(1:N, 0.7*N)
maxdepth <- 5
errors <- c()

for(n in seq(1,201,10)){
  glass.bagging <- bagging(Type ~.,data=Glass[sub,], mfinal=n, maxdepth=maxdepth)
  glass.bagging.pred <- predict.bagging(glass.bagging, newdata=Glass[-sub, ])
  errors <- append(errors,glass.bagging.pred$error)
  print(n)
}

plot(seq(1,201,10), errors, xlab='Trees', ylab='Errors', type='l')
errors


# Метод K ближайших соседей:
knn_predict <- function(test_data,train_data, k_value, ncol_type,weights){
  
  pred <- c()
  for(i in c(1:nrow(test_data))){
    eu_dist =c()
    eu_char = c()
    good = 0
    bad = 0
    
    for(j in seq(1,nrow(train_data))){
      eu_dist <- c(eu_dist, dist(rbind(test_data[i,], train_data[j,])))
      eu_char <- c(eu_char, as.character(train_data[j,ncol_type]))
    }
    
    eu <- data.frame(eu_char, eu_dist,weights)
    eu <- eu[order(eu$eu_dist),]
    
    eu <- eu[1:k_value,]
    classes <- levels(as.factor(train_data[,ncol(train_data)]))
    
    votes<-c()
    for(k in seq(1,length(classes))){
      
      vote<-0
      for(m in seq(1,dim(eu)[1])){
        if(eu[m,1]==classes[k]){
          vote<-vote+eu[m,3]
        }
      }
      votes<-append(votes,vote)
    }
    
    votes<-which.max(votes)
    pred<-append(pred,classes[votes])
    
  }
  
  return(pred)
  
}


#Алгоритм бустинг с классификатором K ближайших соседей
data("Glass")
data("Vehicle")

glass <- Glass
vehicle <- Vehicle

vehicle <- cbind(vehicle,as.numeric(vehicle[,ncol(vehicle)]))
vehicle <- vehicle[,-(ncol(vehicle)-1)]

colnames(vehicle) <- c(colnames(vehicle)[-ncol(vehicle)],"Type")
l <- length(glass[,1])
sub <- sample(1:l,0.7*l)

train <- glass[sub,]
test <- glass[-sub,]

class_num <- length(levels(as.factor(train$Type)))
iterations <- 5
weigths_classificators<-matrix(nrow=iterations,ncol=dim(train)[1])
weights <- c()

for(i in seq(1,dim(train)[1])){
  weights[i] <- 1/dim(train)[1]
}

alphas <- c()
fitted <- data.frame(seq(1,dim(train)[1]))


# Обучение

for(i in seq(1,iterations)){
  
  print(i)
  print(weights)
  weigths_classificators[i,]<-weights
  predicted<-c()
  
  for(train_idx in seq(1:dim(train)[1])){
    predicted<-c(predicted,knn_predict(train[train_idx,],train[-train_idx,],
                                       5, ncol(train),weights[-train_idx]))
  }
  
  fitted <- cbind(fitted,predicted)
  eps <- 0
  
  for(j in seq(1,dim(train)[1])){
    if(as.numeric(predicted[j]) != as.numeric((train$Type)[j])){
      eps <- eps + weights[j]
    }
    
  }
  
  alpha <- 1/2*log((1-eps)/eps) + log(class_num-1)
  alphas <- append(alphas,alpha)
  
  for(j in seq(1,length(weights))){
    if(as.numeric(train[j,ncol(train)]) == as.numeric(predicted[j])){
      m <- 1
    }
    
    else{
      m <- -1
    }
    
    weights[j] <- weights[j]*exp(-alpha*m)
  }
  
  weight_ <- sum(weights)
  
  for(j in seq(1,length(weights))){
    weights[j] <- weights[j]/weight_
  }
}

for(i in seq(1,length(alphas))){
  alphas[i] <- alphas[i]/sum(alphas)
}


# Результаты на тестовой выборке
outputs <- c()

for(i in seq(1,nrow(test))){
  predictor<-matrix(nrow=iterations,ncol=2)
  
  for(j in seq(1,iterations)){
    predictor[j,1]<-(knn_predict(test[i,],train,5, ncol(test),weigths_classificators[j,]))
    
    print(predictor[j,1])
    predictor[j,2]<-alphas[j]
  }
  
  vote<-c()
  for(l in levels(as.factor((predictor[,1])))){
    vote1=0
    
    for(o in seq(1:nrow(predictor))){
      if(predictor[o,1]==l){
        vote1<-vote1+as.numeric(predictor[o,2])
      } 
    }
    
    vote<-c(vote,vote1) 
  }
  
  outputs<-c(outputs,levels(as.factor((predictor[,1])))[which.max(vote)])
}

table(as.numeric(outputs),test[,ncol(test)])
error <- 1-sum(diag(table(as.numeric(outputs),test[,ncol(test)])))/dim(test)[1]
error
