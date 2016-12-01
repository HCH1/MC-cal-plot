## https://www.r-statistics.com/2013/03/updating-r-from-r-on-windows-using-the-installr-package/
# installing/loading the package:
# if(!require(installr)) {
# install.packages("installr"); require(installr)} #load / install+load installr
# updateR()
##
# mydata70ls = read.csv("o1201_PC.EN.RX.1_3_PC70ls_pt5K.csv")
mydata70 = read.csv("o1201_PC.EN.RX.1_4_PC70_pt5K.csv")
mydata40 = read.csv("o1201_PC.EN.RX.1_5_PC40_pt5K.csv")
mydata100 = read.csv("o1201_PC.EN.RX.1_PC100_pt5K.csv")
##
# eg DemoCalPlotV2(mydata100$AMinTopChord, mydata100$AMinBottomChord, mydata70$AMinTopChord, mydata70$AMinBottomChord, mydata40$AMinTopChord, mydata40$AMinBottomChord)

##
DemoCalPlotV2 <- function(t1,b1,t2,b2,t3,b3)
{
mean1 <- mean(b1)
top100 <- mean(t1) - 3*sd(t1)
bot100 <- mean(b1) + 3*sd(b1)
ans_bt100 <- bot100 - top100

mean2 <- mean(b2)
top70 <- mean(t2) - 3*sd(t2)
bot70 <- mean(b2) + 3*sd(b2)
ans_bt70 <- bot70 - top70

mean3 <- mean(b3)
top40 <- mean(t3) - 3*sd(t3)
bot40 <- mean(b3) + 3*sd(b3)
ans_bt40 <- bot40 - top40
##
val <- c(mean1, mean2, mean3, bot100, bot70, bot40, top100, top70, top40, ans_bt100, ans_bt70, ans_bt40)
mx_a = matrix(
	val, 	
	nrow=3, 
	ncol=4);
mx_a2 <- cbind(mx_a, mx_a[,4]/mx_a[,2])
##
write.csv(x = mx_a2, file = "oDemoCalPlotV2.csv")
##
return(mx_a2)
}
## 
## http://www.harding.edu/fmccown/r/
# plot(mx_a2[,5], type="o", col="blue", ylim=c(0,120))
plotdata = read.csv("oDemoCalPlotV2.csv")
plot(plotdata$V2)
lines(plotdata$V3)
## https://www.r-bloggers.com/box-plot-with-r-tutorial/
boxplot(mydata100$AMinTopChord, mydata100$AMinBottomChord, mydata70$AMinTopChord, mydata70$AMinBottomChord, mydata40$AMinTopChord, mydata40$AMinBottomChord)
## https://www.r-bloggers.com/exploratory-data-analysis-combining-box-plots-and-kernel-density-plots-into-violin-plots-for-ozone-pollution-data/
install.packages("vioplot")
library("vioplot")
vioplot(mydata100$AMinTopChord, mydata100$AMinBottomChord, mydata70$AMinTopChord, mydata70$AMinBottomChord, mydata40$AMinTopChord, mydata40$AMinBottomChord)
