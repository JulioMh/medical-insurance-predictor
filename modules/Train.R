
my.train <- function(method){

  fitControl <- trainControl(## 10-fold CV
    method = "repeatedcv",
    number = 10,
    repeats = 10,
    search = "grid")  # hyper-parameters random search 
  
  model <- train(charges ~ .,
                    data = insurance.train,
                    method = method,
                    trControl = fitControl,
                    preProcess = c('scale', 'center'),
                    na.action = na.omit)
  
  my.save(model,  paste(method, ".rds", sep = ""))
  
  result <- my.summary(model)
}

my.save <- function(model, file){
  saveRDS(model, file)
}

my.read <- function(file){
  result <- readRDS(file$name)
}

my.summary <- function(model){
  preds <- predict(model, insurance.test)
  
  result <- data.frame(RealValue = insurance.test$charges, PredictedCharges = preds)
}

