#case 1

rm(list=ls())

x<-read.csv("C:\\Users\\SAUKAURYA\\Desktop\\R\\sem 2\\exp_6_1.csv")
x

#convert into matrix
x<-data.matrix(x)
x

#convert into vector
y<-c(x)
y

#each treatment is replicated 4 times

treatment<-gl(n=6,k=4,length=24,labels=c("T1","T2","T3","T4","T5","T6"))
treatment

#each block is replicated 1 time

block<-gl(n=4,k=1,length=24,labels=c("B1","B2","B3","B4"))
block

#Two-way ANOVA

rbd<-aov(y~treatment+block)
rbd

summary(rbd)

#compare theoretical and empirical errors
qqnorm(rbd$residuals,datax=T)
qqline(rbd$residuals,datax=T,col=2)


#case 2
rm(list=ls())
x<-read.csv("C:\\Users\\SAUKAURYA\\Desktop\\R\\sem 2\\exp_6_2.csv")
x
aov.out<-aov(out~treatment+block,data=x)
aov.out
summary(aov.out)
replications(out~treatment+block,data=x)
TukeyHSD(aov.out)#,which=c("treatment","block"),ordered=T)
plot(TukeyHSD(aov.out))#,which=c("treatment","block"),ordered=T))
