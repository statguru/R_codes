rm(list=ls())
#to check whether the sample contains at least 10 females
countSample=function(x) 
{
  count=0
  i=1
  while(i<=30){
    if(x[i]==1){
      count=count+1
    }
    i=i+1
  }
  if(count>=10){ 
    return (TRUE)
  }else{
    return (FALSE)
  }
}
sampleGenerate=function(n)
{
  i=1
  count=0
  #we denote the males by  0 and females by 1
  x=c(rep(0,125),rep(1,75))  
  while(i<=n){
    #drawing a random sample of size 30 from a population of size 200
    y=sample(x,size=30,replace=FALSE) 		
    if(countSample(y)){
      count=count+1
    }
    i=i+1
  }
  p=count/n
  return (p) 
}
draw1=function() 
{
  w=1
  x=rep(0,100)
  y=rep(0,100)
  i=1000
  while(i<=100000){
    x[w]=sampleGenerate(i)
    y[w]=i
    w=w+1
    i=i+1000
  }
  plot(y,x,type="l",xlab="no. of repetitions   
       of the experiment",ylab="relative frequency")
}

#to find whether the roots of the equation a*x^2+b*x+c=0 are real
isReal=function(a,b,c)
{	
  #calculating the discriminant
  d= b^2-4*a*c 
  if(d>=0)
  {
    return (TRUE)
  }
  else{
    return (FALSE)
  }
}
#to calculate the relative frequency
probability=function(n) 
{
  i=1
  count=0
  while(i<=n)
  {
    #throwing a dice three times
    a=sample(1:6,size=1)	
    b=sample(1:6,size=1)
    c=sample(1:6,size=1)
    if(isReal(a,b,c))
    {
      count=count+1
    }
    i=i+1
  }
  #calculating the relative frequency
  p=count/n 
  return (p)
}
draw2=function()
{
  x=rep(0,100)
  y=rep(0,100)
  w=1
  i=1000
  while(i<=100000)
  {
    x[w]=probability(i)
    y[w]=i
    i=i+1000
    w=w+1
  }
  plot(y,x,type="l",xlab="no. of repetitions of the 
       experiment",ylab="relative frequency")
}

#to play the game
playGame=function()
{
  p=as.numeric(readline("enter p : "))
  q=as.numeric(readline("enter q : "))
  prob1=c(p,q,p) 
  prob2=c(q,p,q)
  i=k=l=1
  count1=count2=0
  win1=c(0,0,0) 
  win2=c(0,0,0) 
  result=c(0,0,0)
  while(i<=100000)
  {
    result=runif(3,0,1) 
    while(k<=3){
      if(result[k]<prob1[k])
      {
        win1[k]=1
      }
      k=k+1
    }
    if(((win1[1]==1)&&(win1[2]==1))||
       ((win1[2]==1)&&(win1[3]==1)))  
    {
      count1=count1+1
    }
    k=1
    while(l<=3){
      if(result[l]<prob2[l])
      {
        win2[l]=1
      }
      l=l+1
    }
    if(((win2[1]==1)&&(win2[2]==1))||
       ((win2[2]==1)&&(win2[3]==1)))
    {
      count2=count2+1
    }
    l=1
    win1=c(0,0,0)
    win2=c(0,0,0)
    i=i+1
  }
  x=c((count1/100000),(count2/100000))
  return (x)
}
