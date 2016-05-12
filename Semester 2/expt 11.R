rm(list=ls())
f<-function(x)exp(-x)-5*x+6

bisection.root<-function(f,upper,lower,tol)
{
  fa<-f(lower)
  fb<-f(upper)
  if(fa*fb>0)
    stop("the root doest not lie between the given values")
  repeat{
    c<-(upper+lower)/2
    fc<-f(c)
    if(abs(fc)<=tol)break
    if(fa*fc<0)upper=c
    if(fb*fc<0)lower=c
  }
  return(c(c))
}