best <- function(state, outcome) {
  ## Read outcome data
    source("aux.R") ##including file with aux funcitons
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")    ##Read data from file
    income <- c("heart attack", "heart failure", "pneumonia") ##creating vector to test input
    subset <-data[,c(2,7,11,17,23)]     ##Subsetting the data as we need only those variables
    for (i in 3:5) subset[,i] <- as.numeric(subset[,i]) ## 'numerizing' the rates
    
    ## Check that state and outcome are valid
  if (check(data$State, state) == FALSE)
      stop ("invalid state")
  else if (check(income, outcome) == FALSE)
      stop ("invalid outcome")
  else
  
      ## Return hospital name in that state with lowest 30-day death
      s <-split(subset, subset$State) ##splitting data set to states data
      work <- s[[state]] ##selecting the exact state
    ##work[sapply(work[,3:5], min, na.rm = TRUE),] ##apply work
    index <- (which(income == outcome)) + 2 ##determining in which column we are to look
    x <- which (work[,index] == min(work[,index], na.rm = TRUE)) ##detrmining index of the hospital with lowest rating
    return(work[x,1])
}