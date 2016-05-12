#Fertility
str(swiss$Fertility)

#Measures of Central Tendency
mean(swiss$Fertility)
median(swiss$Fertility)

#measures of Dispersion
sd(swiss$Fertility)
IQR(swiss$Fertility)
range(swiss$Fertility)

#Data Visualization
boxplot(swiss$Fertility,main="Box Plot of Fertility",outcol="red",pch=19)
boxplot(swiss$Fertility)$out
stem(swiss$Fertility)
h1<-hist(swiss$Fertility,main="Histogram of Fertility",xlab="Fertility",col="yellow")
x<-seq(min(swiss$Fertility),max(swiss$Fertility),length=70)
y<-dnorm(x,mean(swiss$Fertility),sd(swiss$Fertility))
y<-y*diff(h1$mids[1:2])*length(swiss$Fertility)
lines(x,y,col="red",lwd=2)

#Testing for normality
qqnorm(swiss$Fertility,main="Q-Q Plot of Fertility",col="red",pch=19)
qqline(swiss$Fertility)
ks.test(swiss$Fertility,"pnorm",mean(swiss$Fertility),sd(swiss$Fertility))
shapiro.test(swiss$Fertility)

#Agriculture
str(swiss$Agriculture)

#Measures of Central Tendency
mean(swiss$Agriculture)
median(swiss$Agriculture)

#measures of Dispersion
sd(swiss$Agriculture)
IQR(swiss$Agriculture)
range(swiss$Agriculture)

#Data Visualization
boxplot(swiss$Agriculture,main="Box Plot of Agriculture",outcol="red",pch=19)
boxplot(swiss$Agriculture)$out
stem(swiss$Agriculture)
h1<-hist(swiss$Agriculture,main="Histogram of Agriculture",xlab="Agriculture",col="yellow")
x<-seq(min(swiss$Agriculture),max(swiss$Agriculture),length=70)
y<-dnorm(x,mean(swiss$Agriculture),sd(swiss$Agriculture))
y<-y*diff(h1$mids[1:2])*length(swiss$Agriculture)
lines(x,y,col="red",lwd=2)

#Testing for normality
qqnorm(swiss$Agriculture,main="Q-Q Plot of Agriculture",col="red",pch=19)
qqline(swiss$Agriculture)
ks.test(swiss$Agriculture,"pnorm",mean(swiss$Agriculture),sd(swiss$Agriculture))
shapiro.test(swiss$Agriculture)

#Examination
str(swiss$Examination)

#Measures of Central Tendency
mean(swiss$Examination)
median(swiss$Examination)

#measures of Dispersion
sd(swiss$Examination)
IQR(swiss$Examination)
range(swiss$Examination)

#Data Visualization
boxplot(swiss$Examination,main="Box Plot of Examination",outcol="red",pch=19)
boxplot(swiss$Examination)$out
stem(swiss$Examination)
h1<-hist(swiss$Examination,main="Histogram of Examination",xlab="Examination",col="yellow")
x<-seq(min(swiss$Examination),max(swiss$Examination),length=70)
y<-dnorm(x,mean(swiss$Examination),sd(swiss$Examination))
y<-y*diff(h1$mids[1:2])*length(swiss$Examination)
lines(x,y,col="red",lwd=2)

#Testing for normality
qqnorm(swiss$Examination,main="Q-Q Plot of Examination",col="red",pch=19)
qqline(swiss$Examination)
ks.test(swiss$Examination,"pnorm",mean(swiss$Examination),sd(swiss$Examination))
shapiro.test(swiss$Examination)

#Education
str(swiss$Education)

#Measures of Central Tendency
mean(swiss$Education)
median(swiss$Education)

#measures of Dispersion
sd(swiss$Education)
IQR(swiss$Education)
range(swiss$Education)

#Data Visualization
boxplot(swiss$Education,main="Box Plot of Education",outcol="red",pch=19)
boxplot(swiss$Education)$out
stem(swiss$Education)
h1<-hist(swiss$Education,main="Histogram of Education",xlab="Education",col="yellow")
x<-seq(min(swiss$Education),max(swiss$Education),length=70)
y<-dnorm(x,mean(swiss$Education),sd(swiss$Education))
y<-y*diff(h1$mids[1:2])*length(swiss$Education)
lines(x,y,col="red",lwd=2)

#Testing for normality
qqnorm(swiss$Education,main="Q-Q Plot of Education",col="red",pch=19)
qqline(swiss$Education)
ks.test(swiss$Education,"pnorm",mean(swiss$Education),sd(swiss$Education))
shapiro.test(swiss$Education)

#Catholic
str(swiss$Catholic)

#Measures of Central Tendency
mean(swiss$Catholic)
median(swiss$Catholic)

#measures of Dispersion
sd(swiss$Catholic)
IQR(swiss$Catholic)
range(swiss$Catholic)

#Data Visualization
boxplot(swiss$Catholic,main="Box Plot of Catholic",outcol="red",pch=19)
boxplot(swiss$Catholic)$out
stem(swiss$Catholic)
h1<-hist(swiss$Catholic,main="Histogram of Catholic",xlab="Catholic",col="yellow")
x<-seq(min(swiss$Catholic),max(swiss$Catholic),length=70)
y<-dnorm(x,mean(swiss$Catholic),sd(swiss$Catholic))
y<-y*diff(h1$mids[1:2])*length(swiss$Catholic)
lines(x,y,col="red",lwd=2)

#Testing for normality
qqnorm(swiss$Catholic,main="Q-Q Plot of Catholic",col="red",pch=19)
qqline(swiss$Catholic)
ks.test(swiss$Catholic,"pnorm",mean(swiss$Catholic),sd(swiss$Catholic))
shapiro.test(swiss$Catholic)

#Infant Mortality
str(swiss$Infant.Mortality)
##Measures of central Tendency
mean(swiss$Infant.Mortality)
median(swiss$Infant.Mortality)

##Measures of Dispersion
sd(swiss$Infant.Mortality)
IQR(swiss$Infant.Mortality)
range(swiss$Infant.Mortality)

#Data Visualization
boxplot(swiss$Infant.Mortality,main="Box Plot of Infant Mortality",outcol="red",pch=19)
boxplot(swiss$Infant.Mortality)$out
stem(swiss$Infant.Mortality)
h1<-hist(swiss$Infant.Mortality,main="Histogram of Infant Mortality",xlab="Infant Mortality",col="yellow")
x<-seq(min(swiss$Infant.Mortality),max(swiss$Infant.Mortality),length=70)
y<-dnorm(x,mean(swiss$Infant.Mortality),sd(swiss$Infant.Mortality))
y<-y*diff(h1$mids[1:2])*length(swiss$Infant.Mortality)
lines(x,y,col="red",lwd=2)

#Testing for Normality
qqnorm(swiss$Infant.Mortality,main="Q-Q Plot of Infant Mortality",col="red",pch=19)
qqline(swiss$Infant.Mortality)
ks.test(swiss$Infant.Mortality,"pnorm",mean(swiss$Infant.Mortality),sd(swiss$Infant.Mortality))
shapiro.test(swiss$Infant.Mortality)

#EDA for multiple variables

plot(swiss$Fertility,swiss$Agriculture,main="Fertility vs Agriculture",xlab="Fertility",ylab="Agriculture",col="blue",pch=19)
cor(swiss$Fertility,swiss$Agriculture)
plot(swiss$Fertility,swiss$Examination,main="Fertility vs Examination",xlab="Fertility",ylab="Examination",col="blue",pch=19)
cor(swiss$Fertility,swiss$Examination)
plot(swiss$Fertility,swiss$Education,main="Fertility vs Education",xlab="Fertility",ylab="Education",col="blue",pch=19)
cor(swiss$Fertility,swiss$Education)
plot(swiss$Fertility,swiss$Catholic,main="Fertility vs Catholic",xlab="Fertility",ylab="Catholic",col="blue",pch=19)
cor(swiss$Fertility,swiss$Catholic)
plot(swiss$Fertility,swiss$Infant.Mortality,main="Fertility vs Infant Mortality",xlab="Fertility",ylab="Infant Mortality",col="blue",pch=19)
cor(swiss$Fertility,swiss$Infant.Mortality)
plot(swiss$Agriculture,swiss$Examination,main="Agriculture vs Examination",xlab="Agriculture",ylab="Examination",col="blue",pch=19)
cor(swiss$Agriculture,swiss$Examination)
plot(swiss$Agriculture,swiss$Education,main="Agriculture vs Education",xlab="Agriculture",ylab="Education",col="blue",pch=19)
cor(swiss$Agriculture,swiss$Education)
plot(swiss$Agriculture,swiss$Catholic,main="Agriculture vs Catholic",xlab="Agriculture",ylab="Catholic",col="blue",pch=19)
cor(swiss$Agriculture,swiss$Catholic)
plot(swiss$Agriculture,swiss$Infant.Mortality,main="Agriculture vs Infant mortality",xlab="Agriculture",ylab="Infant Mortality",col="blue",pch=19)
cor(swiss$Agriculture,swiss$Infant.Mortality)
plot(swiss$Examination,swiss$Education,main="Examination vs Education",xlab="Examination",ylab="Education",col="blue",pch=19)
cor(swiss$Examination,swiss$Education)
plot(swiss$Examination,swiss$Catholic,main="Examination vs Catholic",xlab="Examination",ylab="Catholic",col="blue",pch=19)
cor(swiss$Examination,swiss$Catholic)
plot(swiss$Examination,swiss$Infant.Mortality,main="Examination vs Infant Mortality",xlab="Examination",ylab="Infant Mortality",col="blue",pch=19)
cor(swiss$Examination,swiss$Infant.Mortality)
plot(swiss$Education,swiss$Infant.Mortality,main="Education vs Infant Mortality",xlab="Education",ylab="Infant Mortality",col="blue",pch=19)
cor(swiss$Education,swiss$Infant.Mortality)
plot(swiss$Education,swiss$Catholic,main="Education vs Catholic",xlab="Education",ylab="Catholic",col="blue",pch=19)
cor(swiss$Education,swiss$Catholic)
plot(swiss$Catholic,swiss$Infant.Mortality,main="Catholic vs Infant Mortality",xlab="Catholic",ylab="Infant Mortality",col="blue",pch=19)
cor(swiss$Catholic,swiss$Infant.Mortality)

#Regression Analysis
model<-lm(swiss$Agriculture~swiss$Fertility)
summary(model)
plot(model)




