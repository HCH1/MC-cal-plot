## http://www.sr.bham.ac.uk/~ajrs/R/r-function_list.html
## http://stackoverflow.com/questions/6939136/how-to-overlay-density-plots-in-r
## 
mydata = read.csv("1129demov2.csv")
myans1 <- summary(mydata)
write.table(x = myans1, file = "o1129v1.csv", sep = ",", col.names = NA, qmethod = "double")
# library("stats")
md_col1_sd <- sd(mydata$AMinTopChord)
md_col1_p3sigma <- mean(mydata$AMinTopChord) + 3*md_col1_sd
md_col1_m3sigma <- mean(mydata$AMinTopChord) - 3*md_col1_sd
# library("ggplot2")
d <- density(mydata$AMinTopChord) # returns the density data
hist(mydata$AMinTopChord, prob=TRUE)
lines(d) # use lines for the second one
# plot(d) # plots the results
