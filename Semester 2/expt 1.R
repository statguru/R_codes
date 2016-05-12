rm(list=ls())

#read the table
x<-read.csv("C:\\Users\\SAUKAURYA\\Desktop\\R\\sem 2\\exp_1.csv")
typeof(x)
str(x)
attributes(x)

#change column names
colnames(x)<-c("sub1","sub2","sub3","sub4")
x

#change row names
rownames(x)<-c("A","B","C","D","E","F")
x

#covariance matrix

cov(x)

#correlation matrix

cor(x,method=c("spearman"))

#inverse of the matrix

y<-x[-5:-6,]
y
solve(y)

#generalized inverse

library(MASS)
ginv(x)
z<-as.matrix(x)
typeof(z)
str(z)
attributes(z)
ginv(z)

#transpose of the matrix
t(x)

#rank of the matrix
library(Matrix)
rankMatrix(y)

#to find column sums
colSums(x)

#to find row sums
rowSums(x)

#to find determinant of the matrix
w<-z[-5:-6,]
det(w)

#to find eigen values and vectors
eigen(x,symmetric=F)
eigen(y,symmetric = F)

#to find trace of a matrix
sum(eigen(y)$values)

A<-matrix(1:24,nrow=6,byrow=T)
A

#addition of two matrices
A+x

#multiplication of two matrices
x<-as.matrix(x)
A %*% t(x)
