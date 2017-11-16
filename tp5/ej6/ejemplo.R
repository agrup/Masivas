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
  
kmedia2 <- function(ds,cc,ex){
  if (ex !=0){
    ds<-ds[,-c(ex)]
  }
  
  ds.est<-scale(tr2.est)
  kcc<-kmeans(ds.est,cc)
  distancias.ds=dist(ds.est,method="manhattan")
  coef.silueta.kcc<-silhouette(kcc$cluster,distancias.ds)
  return (coef.silueta.kcc)
}

  for (cc in 3:9){
  
        kr<- kmedia2(ds,cc,0) 
        titulo = paste("cantidad k:",cc)
        #png(filename = paste(titulo,'.png', sep = '') )
        plot(kr,col=brewer.pal(cc,"Set1"),cex.names=0.7,main =titulo )
        #dev.off()
                
  }
  #plot(kr,col=brewer.pal(cc,"Set1"),cex.names=0.7,main =titulo )
  #Siluetas<-0
  #Siluetas <- data.frame(Centros = c(Lcc),exlcuido=c(Lex),IndiceSil = (Lsw))

  #which.max(Siluetas$IndiceSil)
  
