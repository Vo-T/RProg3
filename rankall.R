rankall <- function(outcome, num = "best") {
    ## Read outcome data
    source("aux.R") ##including the script that will do it for me
    index <- (which(income == outcome)) + 2    
    
    ## Check that outcome are valid
    if (check(income, outcome) == FALSE)
        stop ("invalid outcome")
    else
    
    ## For each state, find the hospital of the given rank
    s <-split(data, data$State) ##splitting data set to states data
    sorted <- lapply(s, function(x) x[order(x[,index], x[,1], na.last=NA),]) ##ordering list in right
    if (num=="best")
        result <- sapply(sorted, function(x) x[1,c(1,2)])
    else if (num=="worst")
        result <- sapply(sorted, function(x) x[nrow(x),c(1,2)])
    else result <- sapply(sorted, function(x) x[num,c(1,2)])
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    final <- as.data.frame(t(as.data.frame(result)))
    names(final) <- c("hospital","state")
    ##return(as.data.frame(t(as.data.frame(result))),colnames = c("hospital","state")) ##dunno y, but I need to transpose matrix ;)
    return(final)
}
