library(caret)
library(cluster)
library(RColorBrewer)
ds<- ds_abandono[1:2000,-c(3)]
dmy = dummyVars("~ .", data = ds,fullRank = T, na.rm = T)
#tr<-0
tr <- data.frame(predict(dmy, newdata = ds))


haz.cero.na=function(x){
  ifelse(is.na(x),0,x)}

tr2=data.frame(sapply(tr,haz.cero.na))#hago 0 los valores na de una variable
tr2.est<-scale(tr2)
#plot(tr2)
cc=3
i=0
#for (cc in 3:4){
  #for(ex in 1:length(tr2)){
    for(espi in 1 :length(tr2)){
    kr<- kmedia(tr2,3,espi,0) 
    Lcc[i]<-cc
    Lex[i]<-espi
    Lsw[i]<-(mean(kr[,3]))
    print(Lsw[i])
    i=i+1
    #titulo=paste("Titulo atributo excluido: ",ex,"-",espi," cantidad k:",cc)
    #plot(kr,col=brewer.pal(cc,"Set1"),cex.names=0.7,main =titulo )
    }
  #}
#}
kr<- kmedia(tr2,3,ex,5) 
plot(kr,col=brewer.pal(cc,"Set1"),cex.names=0.7,main =titulo )

Siluetas <- data.frame(Centros = c(Lcc),exlcuido=c(Lex),IndiceSil = (Lsw))
Siluetas
kord<-sort(Siluetas$IndiceSil)
print(kord)
summary(kord)
which.max(Siluetas$IndiceSil)

