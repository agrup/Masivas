library(cluster)
library(RColorBrewer)
library(readr)
trigo <- read_delim("~/Unlu/2017-2do/Masivas/tp5/ds_clusters/trigo.csv", 
                    ";", escape_double = FALSE, col_types = cols(coef_asimetrima = col_number(), 
                                                                 long_kernel = col_number(),compact = col_number()), trim_ws = TRUE)
kmedia <- function(ds,cc,ex){
#ex cluster a sacar
#cc cantidad de centroides
#ds data set numerico
if (ex !=0){
  ds<-ds[,-c(ex)]
}

  ds.est<-scale(ds)
  kcc<-kmeans(ds.est,cc)
  distancias.ds=dist(ds.est,method="manhattan")
  coef.silueta.kcc<-silhouette(kcc$cluster,distancias.ds)
  return (coef.silueta.kcc)
}
  for (i in 3:8){ #i cantidad de k
    k<-kmedia(trigo,i,0)
    print(mean(k[,3]))
    titulo=paste("Titulo : cantidad k:",i)
    plot(k,col=brewer.pal(i,"Set1"),cex.names=0.7,main =titulo )
  }

