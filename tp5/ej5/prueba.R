library(caret)
library(cluster)
library(RColorBrewer)
library(readr)

ds<- ds_abandono[1:500,-c(3,4,5,15)]

dmy = dummyVars("~ .", data = ds,fullRank = T, na.rm = T)#haga las variables dumy evitando las na
tr <- data.frame(predict(dmy, newdata = ds))

tr.est<-scale(tr)
haz.cero.na=function(x){
  ifelse(is.na(x),1,x)}
tr2=data.frame(sapply(tr,haz.cero.na))#hago 0 los valores na de una variable
tr2.est<-data.frame(scale(tr2))
for (cc in 3:9){
  kcc<-kmeans(tr2.est,cc)
  distancias.tr=dist(tr.est,method="euclidian")
  coef.silueta.kcc<-silhouette(kcc$cluster,distancias.tr)
  kr<-(coef.silueta.kcc)        
  titulo = paste("cantidad de k: ",cc)
  plot(kr,col=brewer.pal(cc,"Set1"),cex.names=0.7,main =titulo )
}