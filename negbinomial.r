http://datavoreconsulting.com/programming-tips/count-data-glms-choosing-poisson-negative-binomial-zero-inflated-poisson/

    #média
media<-seq(1,4,length=4)
quantidade<-seq(1,10,length=4)

par(mfrow=c(length(media),length(quantidade)),mar=c(2,2,1,1))


for(i in 1:length(media)) {
    for(j in 1:length(quantidade)){
        plot(0,0,type="n",xlim=c(1,10),ylim=c(0,0.4),main=paste("Média= ",media[i]," Quantidade= ",quantidade[j],sep=""),
             xaxt="n",yaxt="n",frame=F)
        if(j==1) {axis(2)} else {axis(2,labels =F)}
        if(i==4) {axis(1)} else {axis(1,labels =F)}
        points(dnbinom(seq(1,15), mu = media[i], size = quantidade[j]),type="l")
    }
}

#prob
probabilidade<-round(seq(0.50,0.505,length=4),digits=2)
quantidade<-seq(1,10,length=4)

media
(probabilidade*media)/(1-probabilidade)


par(mfrow=c(length(media),length(quantidade)),mar=c(2,2,1,1))


for(i in 1:length(media)) {
    for(j in 1:length(quantidade)){
        plot(0,0,type="n",xlim=c(1,10),ylim=c(0,0.4),main=paste("Prob= ",probabilidade[i]," Quantidade= ",quantidade[j],sep=""),
             xaxt="n",yaxt="n",frame=F)
        if(j==1) {axis(2)} else {axis(2,labels =F)}
        if(i==4) {axis(1)} else {axis(1,labels =F)}
        points(dnbinom(seq(1,15),prob=probabilidade[i], size = quantidade[j]),type="l")
    }
}


mean(rnbinom(1000,mu=1,size=10));sd(rnbinom(1000,mu=1,size=10))
mean(rnbinom(1000,mu=2,size=10));sd(rnbinom(1000,mu=2,size=10))
mean(rnbinom(1000,mu=4,size=10));sd(rnbinom(1000,mu=4,size=10))
mean(rnbinom(1000,mu=8,size=10));sd(rnbinom(1000,mu=8,size=10))
mean(rnbinom(1000,mu=16,size=10));sd(rnbinom(1000,mu=16,size=10))


mean(rnbinom(1000,mu=1,size=100));sd(rnbinom(1000,mu=1,size=100))
mean(rnbinom(1000,mu=2,size=100));sd(rnbinom(1000,mu=2,size=100))
mean(rnbinom(1000,mu=4,size=100));sd(rnbinom(1000,mu=4,size=100))
mean(rnbinom(1000,mu=8,size=100));sd(rnbinom(1000,mu=8,size=100))
mean(rnbinom(1000,mu=16,size=100));sd(rnbinom(1000,mu=16,size=100))

