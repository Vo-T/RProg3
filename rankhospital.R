rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data -- that we
    source("best.R")    ##using the results of previous computations :)
    source("aux.R") ##plugging in the aux script with repeated functions
    subset <-data[,c(2,7,11,17,23)]     ##Subsetting the data as we need only those variables
    for (i in 3:5) subset[,i] <- as.numeric(subset[,i]) ## 'numerizing' the rates
    
    ## Check that state and outcome are valid
    if (check(data$State, state) == FALSE)
        stop ("invalid state")
    else if (check(income, outcome) == FALSE)
        stop ("invalid outcome")
    else
    
        ## Return hospital name in that state with the given rank 30-day death rate
    index <- (which(income == outcome)) + 2 ##detrminig the right column    
    s <-split(subset, subset$State) ##splitting data set to states data
    work <- s[[state]] ##selecting the exact state
    sorted_work <- work[ order(work[,index], work[,1], na.last = NA), ] ##sorting the table by outcome
    if (num=="best")
        return(sorted_work[1,1]) ##defaulting 
    else
    if (num=="worst") 
        return(sorted_work[nrow(sorted_work),1])
    else
    return(sorted_work[num,1]) ##otherwise returning hospital
}
