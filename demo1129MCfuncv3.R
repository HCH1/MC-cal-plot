# we define the function and specify the exponent, second argument directly
mydata = read.csv("1129demov2.csv")
##
MySummary <- function(n) # sets default of exponent to 2 (we just square)
{
  max <- max(n);
  med <- median(n);
  avg <- mean(n);
  min <- min(n);
  stdv <- sd(n);
  p3sigma <- mean(n) + 3*sd(n);
  m3sigma <- mean(n) - 3*sd(n);
  mysum_ans <- rbind(max, med, avg, min, stdv, p3sigma, m3sigma);
  return(mysum_ans)
}
##
# MySummary(mydata$AMinTopChord)