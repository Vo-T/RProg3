## this is an auxiliary script containing several common function
input <- read.csv("outcome-of-care-measures.csv", colClasses = "character")    ##Read data from file
income <- c("heart attack", "heart failure", "pneumonia") ##defining test
data <-input[,c(2,7,11,17,23)]     ##Subsetting the data as we need only those variables
for (i in 3:5) data[,i] <- as.numeric(data[,i])

check <- function (test, probe) {
  test_end = length(test)
  for (i in 1:test_end) {
    if (test[i] == probe) {
      flag = TRUE
      break
    }
    else flag=FALSE
  }
  return(flag)
}