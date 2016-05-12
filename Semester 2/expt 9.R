rm(list=ls())

require(lattice)
x<-singer$height
str(x)
class(x)
length(x)

#t-test
y<-sample(x,size=20,replace= F)
mx<-mean(x)
t.test(y,mu=mx)

#paired t-test
z<-sample(x,size=20,replace=F)
t.test(y,z,paired=T)

#formula method
t.test(extra~group,data=sleep)

#z-test
n<-100
x1<-rnorm(n,mean=5,sd=10)
y<-sample(20,x1,replace=F)
z_stat<-abs((mean(x1)-5)/(10/sqrt(n)))
z_stat
p_val<-2*min(pnorm(z_stat),1-pnorm(z_stat))
p_val
z_tab<-qnorm(0.025,lower.tail =F )
z_tab

#chi-square test for independence of attributes
m<-rbind(c(35,9),c(60,41))
rownames(m)<-c("men","women")
colnames(m)<-c("yes","no")
m
chisq.test(m,correct=F)

#chi-square test fo goodness of fit
a<-c(45,54,23,76)
b<-rep(1/4,4)
chisq.test(a,p=b,correct=F)

#correlation test
head(cars)
cor.test(cars$speed,cars$dist)

#test for equality of variances

a1<-rnorm(50,mean=0,sd=1)
b1<-rnorm(50,mean=0,sd=2)
var.test(a1,b1)
