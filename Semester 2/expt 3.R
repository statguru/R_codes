rm(list=ls())

head(iris)
tail(iris)
#extract sepal length from iris dataset

x<-iris$Sepal.Length
x

em<-ecdf(x)
em
y<-seq(min(x),max(x),length=50)

windows()
par(mfrow=c(1,2))
plot(y,em(y),xlab="x-values",ylab="Empirical CDF",type="s")
lines(y,pnorm(y,mean=mean(x),sd=sd(x)),col="red")

#normal quantile plot
qqnorm(x,datax = T)
qqline(x,datax=T,distribution=qnorm,col=2)
