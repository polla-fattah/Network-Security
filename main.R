
library(caret)
library(party)

readFile <- function(){
  DATA <<- read.csv("data/corrected.csv", sep = ',', header = FALSE)
  
  intrain <- createDataPartition(y = DATA$V42, times= 10, list = FALSE)
  
  training <<- DATA[intrain,]
  testing <<- DATA[-intrain,]
}

classify <- function(){
  set.seed(3033)

}
prune <- function(){
  cf1 <- cforest(V42 ~ . , data= DATA[1:300,30:42], control=cforest_unbiased(mtry=2,ntree=50))
  vimp <- varimp(cf1, conditional=TRUE)
  vauc <- varimpAUC(cf1)
  print(cf1)
}

main <- function(){
  if(!exists("DATA"))
    readFile()
  classify()
  prune()

}

main()