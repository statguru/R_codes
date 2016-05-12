rm(list=ls())

#case 1

set.seed(123)
x<-rgamma(50,scale = 1/2,shape=2)
hist(x)
summary(x)
n<-length(x)
f1<-function(alpha)
{
  n*log(n*alpha/sum(x))-n*digamma(alpha)+sum(log(x))
}
alpha.mle<-uniroot(f=f1,lower = 0.1,upper=10)$root
beta.mle<-n*alpha.mle/sum(x)
list(alpha.mle=alpha.mle,beta.mle=beta.mle)

# case 2
f2<-function(alpha)
{
  n*alpha*log(n*alpha/sum(x))-n*log(gamma(alpha))+(alpha-1)*sum(log(x))-n*alpha
}
x1<-seq(0.1,10,length=100)
y1<-sapply(x1,f2)
plot(x1,y1,xlab=expression(alpha),ylab="LogL",type="l")
abline(v=alpha.mle,lty=2,col=2)
alpha.mle1<-optimize(f=f2,lower=0.1,upper=10,maximum=T)$maximum
beta.mle1<-n*alpha.mle1/sum(x)
list(alpha.mle=alpha.mle,beta.mle=beta.mle,alpha.mle1=alpha.mle1,beta.mle1=beta.mle1)


#case 3

f3<-function(p)
{
  alpha<-p[1]
  beta<-p[2]
  (-1)*(n*alpha*log(beta)-n*log(gamma(alpha))+(alpha-1)*sum(log(x))-beta*sum(x))
}
optim(par=c(2,2),f3)

#case 4

require(lattice)
f4<-function(p)
{
  n*p[1]*log(p[2])-n*log(gamma(p[1]))+(p[1]-1)*sum(log(x))-p[2]*sum(x)
}

x2<-seq(0.1,10,length=50)
y2<-seq(0.1,10,length=50)
g<-expand.grid(alpha=x2,beta=y2)
g$L<-apply(g,1,f4)
wireframe(L ~alpha*beta,data=g,xlab=expression(alpha),ylab=expression(beta),zlab=expression(logL),scales=list(arrows=F),drape=F,colorkey=F,screen=list(z=30,x=-60))

#case 5

z<-matrix(g$L,nrow=length(x))
contour(x2,y2,z,nlevels=30,xlab=expression(alpha),ylab=expression(beta))
points(alpha.mle,beta.mle,col=2,pch=16)

