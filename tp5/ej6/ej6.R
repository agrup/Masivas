library(MASS)
library(klaR)
library(caret)
#plot(ds_abandono[,4])
#a<- scale(ds_abandono)
dsPCA <- preProcess(ds_abandono[,1:length(ds_abandono$promedio_1er_anio)-1],
                    method = "pca",thresh = 0.95)
kmodes(ds_abandono[1:1000,1:2],3)
summary(a)
AB1<-(ds_abandono[,c(1,4,6,7,8,9,10,11,12,13,14,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30)])
plot(AB1)
kmodes
library(lmtest)
library(caret)
dummyVars()