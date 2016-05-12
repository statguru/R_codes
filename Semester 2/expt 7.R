rm(list=ls())

#read the data
x<-read.csv("C:\\Users\\SAUKAURYA\\Desktop\\R\\sem 2\\exp_7.csv",sep=",",header=T)
x
fact<-aov(yield~block+n*p*k,data=x)
fact
summary(fact)

#To draw qqplot of residuals

qqnorm(fact$residuals,datax=T)
qqline(fact$residuals,datax=T,col=2)
