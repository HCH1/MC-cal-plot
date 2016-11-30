mydata = read.csv("1129demov2.csv")
##
MySummary <- function(n)
{
  len <- length(n);
  max <- max(n);
  med <- median(n);
  avg <- mean(n);
  min <- min(n);
  stdv <- sd(n);
  p3sigma <- mean(n) + 3*sd(n);
  m3sigma <- mean(n) - 3*sd(n);
  mysum_ans <- rbind(len, max, med, avg, min, stdv, p3sigma, m3sigma);
  write.table(x = mysum_ans, file = "o1129v2.csv", sep = ",", col.names = NA, qmethod = "double");
  den <- density(n);
  hist(n);
  # lines(den)
  return(mysum_ans)
}
# MySummary(mydata$AMinTopChord)
##
ans1 <- summary(mydata)
##
