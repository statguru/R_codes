rm(list=ls())

#case 1
#Read the table

data <- read.table("C:\\Users\\SAUKAURYA\\Desktop\\R\\sem 2\\exp_5.csv",sep=",",header=T)
data

typeof(data)
class(data)

#convert data frame into matrix

x<- data.matrix(data)
x
typeof(x)
class(x)

#convert matrix into vector

y<-c(x)
y

#Generate factors by specifying the patterns of the levels


treatment<-gl(n=4,k=5,labels=c("t1","t2","t3","t4"))
treatment
#Fit an ANOVA model

crd<-aov(formula=y~treatment)
crd
summary(crd)

#to draw the Q-Q plot
qqnorm(crd$residuals,col=2)
qqline(crd$residuals,col=2)

#case 2

rm(list=ls())

x<-read.csv("C:\\Users\\SAUKAURYA\\Desktop\\R\\sem 2\\exp_5_2.csv")
x
summary(x)
boxplot(yield~treatment,data=x)

#setting orthogonal contrasts

options(contrasts = c("contr.helmert","contr.ploy"))
aov.out<-aov(yield~treatment,data=x)
aov.out
#to check replications
replications(yield~treatment,data=x)
summary(aov.out)

#compare theoretical and empirical error

qqnorm(aov.out$residuals,dataX=T,col=2)
qqline(aov.out$residuals,dataX=T,col=6)

#to create a set of confidence intervals

TukeyHSD(aov.out)
plot(TukeyHSD(aov.out))

#to check homogeneity of variances

bartlett.test(yield~treatment,data=x)
