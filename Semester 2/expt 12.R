rm(list=ls())

iter<-function(x)x-(f(x)/df(x))
f<-function(x)exp(-x)-5*x+6
df<-function(x)-exp(-x)-5

nr.root<-function(seed,tol)
{
  x<-seed
  repeat{
    old<-x
    x<-iter(x)
    if(abs(old-x)<=tol)break
  }
  return(x)
}