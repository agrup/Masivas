library(caret)
library(cluster)
library(RColorBrewer)

library(readr)
ds_abandono <- read_delim("~/Unlu/2017-2do/Masivas/tp5/ds_clusters/ds-abandono.csv", 
                          ";", escape_double = FALSE, trim_ws = TRUE)

ds<- ds_abandono[1:5000,-c(2,3,5,8,15,16)]
dmy = dummyVars("~ .", data = ds,fullRank = T, na.rm = T)
tr<-0
tr <- data.frame(predict(dmy, newdata = ds))
haz.cero.na=function(x){
  ifelse(is.na(x),0,x)}
tr2=data.frame(sapply(tr,haz.cero.na))#hago 0 los valores na de una variable
tr2.est<-data.frame(scale(tr2))

for (cc in 2:9){
  
  
}