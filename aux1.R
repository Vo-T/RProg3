## this is an auxiliary script containing several common function
data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")    ##Read data from file
income <- c("heart attack", "heart failure", "pneumonia") ##defining test

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

data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")    ##Read data from file
income <- c("heart attack", "heart failure", "pneumonia") ##creating vector to test input