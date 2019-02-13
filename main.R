
library(caret)
library(party)
library(relaimpo)
library(earth)

readFile <- function(){
  DATA <<- read.csv("data/corrected.csv", sep = ',', header = FALSE)
  
  intrain <<- createDataPartition(y = DATA$V42, times= 10, list = FALSE)
  
  training <<- DATA[intrain[,1],]
  testing <<- DATA[-intrain[,1],]
}

classify <- function(){
  set.seed(3033)

}

prune <- function(){

}

main <- function(){
  if(!exists("DATA"))
    readFile()
  #classify()
  #prune()

}

main()