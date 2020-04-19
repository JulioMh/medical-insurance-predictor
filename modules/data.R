split <- function(){
  set.seed(54321)
  indexes <- createDataPartition(train$charges,
                                 times = 1,
                                 p = 0.7,
                                 list = FALSE)
  insurance.train <- train[indexes,]
  insurance.test <- train[-indexes,]
  result <- list("insurance.train" = insurance.train,
                 "insurance.test" = insurance.test)
}