rm(list = ls())
str(longley)
class(longley)
pairs(longley)
A<-lm(GNP~Population+Employed,data=longley)
summary(A)
anova(A)
fitted_A<-A$fitted.values
fitted_A
plot(longley)
plot(longley$GNP,type='l',main="Actual vs fitted",xlab="",ylab="GNP")
points(fitted_A,pch=1,ylab="Fitted values",col=3)

#Residuals
a_resi<-A$residuals
plot(a_resi,main="Fitted vs Residuals",ylab="Residuals",xlab="")
abline(h=0)

#normal qq plot
qqnorm(a_resi,datax=T)
qqline(a_resi,datax=T,col='red')
