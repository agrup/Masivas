
ds1<-ds_abandono
str(ds1)

#imputacion de la media del atributo promedio_1er_anio
mediav=mean(ds1$promedio_1er_anio,na.rm=TRUE)

j=1
i=1
while (j<= (16334)){
  if (is.na(ds1$promedio_1er_anio[j])) {
    ds1$promedio_1er_anio[i]<-mediav
  } else{
    ds1$promedio_1er_anio[i]<-ds1$promedio_1er_anio[j]
    
  }
  j=j+1
  i=i+1
}

#imputacion de la media del atributo anios_en_unlu
mediav2=mean(ds1$anios_en_unlu,na.rm=TRUE)
valor= round(mediav2,0)
j=1
i=1
while (j<= (16334)){
  if (is.na(ds1$anios_en_unlu[j])) {
    ds1$anios_en_unlu[i]<-valor
  } else{
    ds1$anios_en_unlu[i]<-ds1$anios_en_unlu[j]
    
  }
  j=j+1
  i=i+1
}

View(ds1$anios_en_unlu)

#elimino los atributos discretos

ds2<-ds1
str(ds2)
ds3<- ds2[,-2]
ds4<- ds3[,-2]
ds5<- ds4[,-3]
ds6<- ds5[,-12]
str(ds6)

#escalo los valores

ds7<-scale(ds6)

distancia<- dist(ds7, method = "euclidean")

ds7.C <- kmeans(ds7, centers = 9)

plot(ds7.C$cluster, col= ds7.C$cluster)


#coeficiente de silueta
silueta<- cluster::silhouette(ds7.C$cluster, distancia)

plot(silueta, col = ds7.C$cluster)



