
my.predict <- function(model, features){

  pred <- predict(model(), features())
  
  result <- pred
}
