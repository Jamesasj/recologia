###http://recologia.com.br/2016/01/estatistica-espacial-point-process/
#####################################
## Tipos de Point Process
#####################################

x_coords<-c(0.3,0.6,0.8,0.2,0.4,0.6,0.8,0.3,0.6,0.8,0.2,0.4,0.6,0.8)
y_coords<-c(0.3,0.3,0.3,0.5,0.5,0.5,0.5,0.7,0.7,0.7,0.9,0.9,0.9,0.9)
jpeg("01.jpg")
plot(x_coords,y_coords,xlim=c(0,1),ylim=c(0,1),pch=19,main="Espaçado",bty="n")
dev.off()

x_coords<-c(0.2,0.9,0.92,0.93,0.78,0.19,0.21,0.5,0.55,0.61,0.94,0.96,0.37,0.41,0.44)
y_coords<-c(0.1,0.2,0.22,0.23,0.3,0.36,0.37,0.4,0.39,0.39,0.43,0.44,0.56,0.53,0.56)*1.8
jpeg("02.jpg")
plot(x_coords,y_coords,xlim=c(0,1),ylim=c(0,1),pch=19,main="Aleatorio",bty="n")
dev.off()

x_coords<-c(0.2,0.22,0.23,0.22,0.2,0.56,0.57,0.87,0.89,0.89,0.89,0.9,0.92,0.925,0.926)
y_coords<-c(0.2,0.22,0.22,0.225,0.28,0.7,0.71,0.8,0.81,0.82,0.83,0.83,0.83,0.82,0.81)
jpeg("03.jpg")
plot(x_coords,y_coords,xlim=c(0,1),ylim=c(0,1),pch=19,main="Agregado",bty="n")
dev.off()

jpeg("04.jpg")
par(mfrow=c(3,1))
x_coords<-c(0.3,0.6,0.8,0.2,0.4,0.6,0.8,0.3,0.6,0.8,0.2,0.4,0.6,0.8)
y_coords<-c(0.3,0.3,0.3,0.5,0.5,0.5,0.5,0.7,0.7,0.7,0.9,0.9,0.9,0.9)
plot(x_coords,y_coords,xlim=c(0,1),ylim=c(0,1),pch=19,main="Espaçado",bty="n")
x_coords<-c(0.2,0.9,0.92,0.93,0.78,0.19,0.21,0.5,0.55,0.61,0.94,0.96,0.37,0.41,0.44)
y_coords<-c(0.1,0.2,0.22,0.23,0.3,0.36,0.37,0.4,0.39,0.39,0.43,0.44,0.56,0.53,0.56)*1.8
plot(x_coords,y_coords,xlim=c(0,1),ylim=c(0,1),pch=19,main="Aleatorio",bty="n")
x_coords<-c(0.2,0.22,0.23,0.22,0.2,0.56,0.57,0.87,0.89,0.89,0.89,0.9,0.92,0.925,0.926)
y_coords<-c(0.2,0.22,0.22,0.225,0.28,0.7,0.71,0.8,0.81,0.82,0.83,0.83,0.83,0.82,0.81)
plot(x_coords,y_coords,xlim=c(0,1),ylim=c(0,1),pch=19,main="Agregado",bty="n")
dev.off()

#####################################
## Pontos dentro de um circulo
######################################

dispersa_semente <- function(r) {    
    angulo <- runif(1,0,2*pi)
    raio <- runif(1,0,r)
    x <- angulo*sin(raio)
    y <- angulo*cos(raio)
    return (c(x,y))
}

##Pontos circulares
centro_x <- 10
centro_y <- 10

jpeg("05.jpg")
plot(centro_x,centro_y,ylab="",xlab="",ylim=c(0,2*centro_y),xlim=c(0,2*centro_x),type="n")

n <- 1000
r <- 10

for (i in 1:n) {
    ponto <- dispersa_semente(r)
    x <- centro_x+ponto[1]
    y <- centro_y+ponto[2]
    points(x,y,pch=19)
}
dev.off()

##retas
centro_x <- 10
centro_y <- 10

jpeg("06.jpg")
plot(centro_x,centro_y,ylab="",xlab="",ylim=c(0,2*centro_y),xlim=c(0,2*centro_x),type="n")


n <- 1000
r <- 10

x<-c()
y<-c()
a<-c()
raio<-c()
distancias<-vector()

for (i in 1:n) {    
    a[i] <- runif(1,0,2*pi)    
    raio[i] <- runif(1,0,r)    
    xi <- a[i]*sin(raio[i])
    yi <- a[i]*cos(raio[i])
    ponto <-c(xi,yi)

    x[i] <- centro_x+ponto[1]
    y[i] <- centro_y+ponto[2]
    lines(c(centro_x,x[i]),c(centro_y,y[i]))
    distancias[i]<-dist(data.frame(origem=c(centro_x,x[i]),destino=c(centro_y, y[i])))
}
dev.off()

jpeg("07.jpg")
layout(matrix(c(1,1,1,2,2,2,3,3,4,4,5,5),ncol=6,nrow=2,byrow=T))
hist(a,main="Raios")
hist(raio,main="Angulos")
hist(distancias,main="Distancias")
hist(x,main="Coordenadas em x")
hist(y,main="Coordenadas em y")
dev.off()

