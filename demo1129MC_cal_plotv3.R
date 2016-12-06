## https://www.r-statistics.com/2013/03/updating-r-from-r-on-windows-using-the-installr-package/
# installing/loading the package:
# if(!require(installr)) {
# install.packages("installr"); require(installr)} #load / install+load installr
# updateR()
##
# mydata70ls = read.csv("o1201_PC.EN.RX.1_3_PC70ls_pt5K.csv")
#mydata70 = read.csv("o1201_PC.EN.RX.1_4_PC70_pt5K.csv")
#mydata40 = read.csv("o1201_PC.EN.RX.1_5_PC40_pt5K.csv")
#mydata100 = read.csv("o1201_PC.EN.RX.1_PC100_pt5K.csv")
mydata20 = read.csv("o1206_PC.EN.RX.1_PC20_pt5K.csv")
mydata40 = read.csv("o1206_PC.EN.RX.1_PC40_pt5K.csv")
mydata70 = read.csv("o1206_PC.EN.RX.1_PC70_pt5K.csv")
mydata100 = read.csv("o1206_PC.EN.RX.1_PC100_pt5K.csv")
##
# eg DemoCalPlotV2(mydata100$AMinTopChord, mydata100$AMinBottomChord, mydata70$AMinTopChord, mydata70$AMinBottomChord, mydata40$AMinTopChord, mydata40$AMinBottomChord, mydata20$AMinTopChord, mydata20$AMinBottomChord)

##
DemoCalPlotV2 <- function(t1,b1,t2,b2,t3,b3,t4,b4)
{
len_b1 <- length(b1)
len_t1 <- length(t1)

max_b1 <- max(b1)
max_b2 <- max(b2)
max_b3 <- max(b3)
max_t1 <- max(t1)
max_t2 <- max(t2)
max_t3 <- max(t3)
max_b4 <- max(b4)
max_t4 <- max(t4)

min_b1 <- min(b1)
min_b2 <- min(b2)
min_b3 <- min(b3)
min_t1 <- min(t1)
min_t2 <- min(t2)
min_t3 <- min(t3)
min_b4 <- min(b4)
min_t4 <- min(t4)

avg_b1 <- mean(b1)
avg_b2 <- mean(b2)
avg_b3 <- mean(b3)
avg_t1 <- mean(t1)
avg_t2 <- mean(t2)
avg_t3 <- mean(t3)
avg_b4 <- mean(b4)
avg_t4 <- mean(t4)

sd_b1 <- sd(b1)
sd_b2 <- sd(b2)
sd_b3 <- sd(b3)
sd_t1 <- sd(t1)
sd_t2 <- sd(t2)
sd_t3 <- sd(t3)
sd_b4 <- sd(b4)
sd_t4 <- sd(t4)

top_t1 <- mean(t1) - 3*sd(t1)
bot_b1 <- mean(b1) + 3*sd(b1)
ans_bt1 <- bot_b1 - top_t1

top_t2 <- mean(t2) - 3*sd(t2)
bot_b2 <- mean(b2) + 3*sd(b2)
ans_bt2 <- bot_b2 - top_t2

top_t3 <- mean(t3) - 3*sd(t3)
bot_b3 <- mean(b3) + 3*sd(b3)
ans_bt3 <- bot_b3 - top_t3

top_t4 <- mean(t4) - 3*sd(t4)
bot_b4 <- mean(b4) + 3*sd(b4)
ans_bt4 <- bot_b4 - top_t4
##
val <- c(bot_b1, bot_b2, bot_b3, bot_b4, top_t1, top_t2, top_t3, top_t4, ans_bt1, ans_bt2, ans_bt3, ans_bt4)
val_b <- c(max_b1, max_b2, max_b3, max_b4, avg_b1, avg_b2, avg_b3, avg_b4, min_b1, min_b2, min_b3, min_b4, sd_b1, sd_b2, sd_b3, sd_b4)
val_t <- c(max_t1, max_t2, max_t3, max_t4, avg_t1, avg_t2, avg_t3, avg_t4, min_t1, min_t2, min_t3, min_t4, sd_t1, sd_t2, sd_t3, sd_t4)

mx_a = matrix(
	val, 	
	nrow=4, 
	ncol=3);
mx_a2 <- cbind(mx_a, mx_a[,3]/mx_a[,1])

mx_val_b = matrix(
	val_b,
	nrow=4, 
	ncol=4);

mx_val_t = matrix(
	val_t, 	
	nrow=4, 
	ncol=4);
	
mx_val_bt <- cbind(mx_val_b, mx_val_t)
##
write.csv(x = mx_a2, file = "oDemoCalPlotV2.csv")
write.csv(x = mx_val_b, file = "omx_val_b.csv")
write.csv(x = mx_val_t, file = "omx_val_t.csv")
write.csv(x = mx_val_bt, file = "omx_val_bt.csv")
##
return(mx_a2)
}
## 
## http://www.harding.edu/fmccown/r/
# plot(mx_a2[,5], type="o", col="blue", ylim=c(0,120))
plotdata = read.csv("oDemoCalPlotV2.csv")
plot(rev(plotdata$V1))
lines(rev(plotdata$V2))
## https://www.r-bloggers.com/box-plot-with-r-tutorial/
boxplot(mydata100$AMinTopChord, mydata100$AMinBottomChord, mydata70$AMinTopChord, mydata70$AMinBottomChord, mydata40$AMinTopChord, mydata40$AMinBottomChord, mydata20$AMinTopChord, mydata20$AMinBottomChord)
## https://www.r-bloggers.com/exploratory-data-analysis-combining-box-plots-and-kernel-density-plots-into-violin-plots-for-ozone-pollution-data/
# install.packages("vioplot")
# library("vioplot")
# vioplot(mydata100$AMinTopChord, mydata100$AMinBottomChord, mydata70$AMinTopChord, mydata70$AMinBottomChord, mydata40$AMinTopChord, mydata40$AMinBottomChord, col = "lightblue", rectCol="gray")
vioplot(mydata100$AMinTopChord, mydata100$AMinBottomChord, mydata40$AMinTopChord, mydata40$AMinBottomChord, col = "lightblue", rectCol="gray")
title("PC40 vs PC100 plot")
abline(h = plotdata[3,2])
abline(h = plotdata[3,3])
abline(h = plotdata[1,2])
abline(h = plotdata[1,3])
##
vioplot(mydata40$AMinTopChord, mydata40$AMinBottomChord, names=c("PC40_Top", "PC40_Bot"), col = "lightblue", rectCol="gray")
title("PC40 plot")
## https://stat.ethz.ch/pipermail/r-help/2007-October/143673.html
abline(h = plotdata[3,2])
abline(h = plotdata[3,3])
##
