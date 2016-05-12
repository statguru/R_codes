rm(list=ls())
windows()
par(mfrow=c(2,2))

#make a sequence
x<-seq(-5,5,by=0.1)

#normal distribution
y<-dnorm(x,mean=0,sd=1)
plot(x,y,type='l',xlab="x-values",ylab="f(x)",main="PDF of N(0,1)",lwd=1)

#add some points on the graph
x1<-seq(-5,5,by=1)
y1<-dnorm(x1,mean=0,sd=1)
points(x1,y1,lwd=3,col=2,cex=1)

z<-pnorm(x,mean=0,sd=1)
plot(x,z,type='l',xlab='x-values',ylab='F(x)',main='CDF of N(0,1)',lwd=1)

rm(list=ls())

#make a sequence
x<-seq(-5,5,by=0.1)

#cauchy distribution
y<-dcauchy(x,location = 0,scale = 1)
plot(x,y,xlab='x-values',ylab='f(x)',main='PDF of C(0,1)',type='l')

#add some points on the graph
x1<-seq(-5,5,by=1)
y1<-dcauchy(x1,location=0,scale=1)
points(x1,y1,lwd=3,col=4,cex=1)

z<-pcauchy(x,location = 0,scale=1)
plot(x,z,xlab='x-values',ylab='F(x)',main="CDF of C(0,1)",type='l')