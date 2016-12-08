##
mx_dtt = read.csv("28SLP_Rev1.1_4.0_Truth Table.csv")
mx_dtt_unpiv = unpivot(mx_dtt) # table will be "device layer value"
##
DemoTT_tou_proh <- function(lay1, val1, lay2, val2)
{
mx_dtt_unpiv[$Layer == lay1, $Value != val1]

mx_dtt_unpiv2 <- cbind(mx_dtt_unpiv, if(mx_dtt_unpiv[,2]==lay1 and ))


}
