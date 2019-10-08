# plumber.R
# load libraries
library(caret)
library(mlbench)
library(randomForest)
library(doMC)

registerDoMC(cores=8)

#* Echo back the input
#* @param msg The message to echo
#* @get /predict
function(msg=""){
  # load dataset
  data(Sonar)
  set.seed(7)
  # create 80%/20% for training and validation datasets
  validation_index <- createDataPartition(Sonar$Class, p=0.80, list=FALSE)
  validation <- Sonar[-validation_index,]
  
  # load the model
  super_model <- readRDS("./final_model.rds")
  print(super_model)
  # make a predictions on "new data" using the final model
  final_predictions <- predict(super_model, validation[,1:60])
  ret <- confusionMatrix(final_predictions, validation$Class)
  list(str(ret)
}



#* Echo back the input
#* @param msg The message to echo
#* @get /echo
function(msg=""){
  list(msg = paste0("The message is: '", msg, "'"))
}

#* Plot a histogram
#* @png
#* @get /plot
function(){
  rand <- rnorm(100)
  hist(rand)
}

#* Return the sum of two numbers
#* @param a The first number to add
#* @param b The second number to add
#* @post /sum
function(a, b){
  as.numeric(a) + as.numeric(b)
}

