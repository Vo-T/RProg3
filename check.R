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