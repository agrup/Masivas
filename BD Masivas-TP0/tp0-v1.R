# ejercicio 1
# Caracteristicas
('Caracteristicas de los datasets')
('Nombre de los atributos')
names(iris)
('Tipo de atributos')
aggregate(.~Species,iris,FUN='mode')

('Instancias del dataset')
str(iris)
('cantidad de instancias 150

50 instancias de cada clase, 50 setosa, 50 versicolor, 50 virginica')
summary(iris[5])

#**********************************************
('Proporcion de las muestras agrupadas por especie')
('Grafico de tortas')
pie(table(iris$Species))
('Grafico de barras')
barplot(table(iris$Species)) 


('Medidas de dispercion ')

('Media por especie por atributo')
aggregate(.~Species, iris, FUN='mean')

('Moda por especie por atributo')
aggregate(.~Species,iris,FUN='mfv')


('Mediana por especie por atributo')
aggregate(.~Species,iris,FUN='mean')


('Mediana Sepal.Length')
mean(iris$Sepal.Length)
('Mediana Petal.Length')
mean(iris$Petal.Length)
('Mediana Sepal.Width')
mean(iris$Sepal.Width)
('Mediana Petal.Width')
mean(iris$Petal.Width)

('Conclusion: Se puede ver que las setosas tienen "sepalos" cortos y anchos comparados con los demas, y petalos mucho mas cortos y angostos, y las virginicas tienden a ser las mas largas de sepal y de petalos ')

#**************************************************

#aggregate( cbind(Sepal.Length,Sepal.Width,Petal.Length,Petal.Width)~Species, iris, FUN='mean')



#aggregate(iris$Species,iris,FUN='mean')

#aggregate(.~Species,iris,FUN='median')

library(modeest)

#table(aggregate(iris$Sepal.Length ~iris$Species))

library(MASS)
parcoord(iris[1:4], col=iris$Species,var.label=T)
boxplot(iris$Sepal.Length~ iris$Species)


hist(iris$Sepal.Length)
pairs(iris[1:4],col=iris$Species)

('Lo graficado coincide con lo visto en el punto 1, se puede ver a la setosa un poco separada de las otrsa especien en cuanto a tamaño, con petalos pequeños, y las otras con valores mas altos pero en cuanto a los sepalos difieren poco entre ellas y se puede diferenciar un poco mas en cuanto a los petalos')
('Varianza')
aggregate(.~Species,iris,FUN='sd')
('Desvio estandar')
aggregate(.~Species,iris,FUN='var')

('Rangos')
aggregate(.~Species,iris,FUN='range')
boxplot(iris$Sepal.Length~ iris$Species)#Sepalos, setosa mas cortos
boxplot(iris$Petal.Length~ iris$Species)#Petalos setosa mucho mas chicos, luego versicolor y mas grandes virginica
boxplot(iris$Sepal.Width~ iris$Species)#Sepalos rangos similares, pero las setosa se puede decir que tiene petalos mas anchos
boxplot(iris$Petal.Width~ iris$Species)#Petalos, Setosa mucho mas angostos y agrupados, versicolor mas grandes que setosa y un poco mas dispersos, virginica mas dispersos aun, y mas anchos  


('Graficos de dispersion')

plot(iris$Petal.Length, iris$Petal.Width, col=iris$Species)#setosa cerca del origen, menor relacion entre largo y ancho de los petalos, muy agrupados
plot(iris$Sepal.Length, iris$Sepal.Width, col=iris$Species)#
plot(iris$Petal.Width, iris$Petal.Width, col=iris$Species)
plot(iris$Sepal.Width, iris$Sepal.Width, col=iris$Species)

('Se observa valores de las setosas difiriendo en todas las variables con respecto a las otras')

('El grafico que mejor describe las variables')
pairs(iris[1:4],col=iris$Species)
#establece comparacion entre todas las variables 