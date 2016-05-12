getN<-function(x,tt=1) {
  if(sum(x)<tt)
    return(NA)
  if(x[1]>tt)
    return(0)
  else
    return(max(which(cumsum(x)<=tt)))
}
library(shiny)
shinyServer(
  
  function(input,output)
  {
    sze<-reactive({
      input$n
    })
    
    regn_data<-reactive({
    p<-as.numeric(input$prob)  
    seed<-input$seed
    data.df<-cbind(p,sze(),seed)
    set.seed(seed)
    car<-vector()
    for(i in 1:sze())
    {
      
      car[i]<-rbinom(1,1,p)
    }
    data<-data.frame(cbind(times<-seq(1,sze()),car))
    colnames(data)<-c("Time","Car")
    first<-0 #assuming the 1st inter-arrival time is 0
    k<-1 #k is the index of the inter_arrival vector
    times[0]<-0
    inter_arrival<-vector()
    for(i in 1:sze())
    {
      if(car[i]==1)
      {
        inter_arrival[k]<-times[i]-first
        k<-k+1
        first<-times[i]
      }
    }
    #Getting the data
    cars<-vector()
    time<-vector()
    k<-1
    for(i in seq(1,sum(inter_arrival),by=20))
    {
      cars[k]<-getN(inter_arrival,i)
      time[k]<-i
      k<-k+1
    }
    reg_data<-data.frame(time,cars)
    reg_data
    })
    output$data<-renderPrint({
      regn_data()
    })
    reg<-reactive({
      model<-glm(cars~time,family=poisson,data=regn_data())
    })
    output$regression<-renderPrint({
      print(summary(reg()))
      coeff<-coef(reg())
      print(paste0("cars=",round(coeff[1],5),"+",round(coeff[2],5),"*time"))
    })
    predicted<-reactive({
      predict(reg())
    })
    output$graph<-renderPlot({
      cars_pred<-sapply(predicted(),exp)
      plot(regn_data()$cars,main="Actuals vs Fits",ylab="cars",type="l")
      lines(cars_pred,col='red')
    })
    output$test<-renderPrint({
      
      print(chisq.test(regn_data()$cars,predicted(),correct=T))
    })
    }
)
